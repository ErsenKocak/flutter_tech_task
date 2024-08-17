import 'package:dio/dio.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/services/i_theme_local_service.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/services/theme_local_service.dart';
import 'package:flutter_tech_task/common/cubit/theme/theme_cubit.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/network/http_client/manager/network_client.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/cubit/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/favorites/data/repositories/i_favorites_repository.dart';
import 'package:flutter_tech_task/features/favorites/data/services/favorites_local_service.dart';
import 'package:flutter_tech_task/features/favorites/data/services/i_favorites_local_service.dart';
import 'package:flutter_tech_task/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/home/data/services/local/book_local_service.dart';
import 'package:flutter_tech_task/features/home/data/services/local/i_book_local_service.dart';
import 'package:flutter_tech_task/features/home/data/services/remote/book_service.dart';
import 'package:flutter_tech_task/features/home/data/services/remote/i_book_service.dart';
import 'package:flutter_tech_task/features/home/domain/repositories/book_repository.dart';
import 'package:flutter_tech_task/features/home/data/repositories/i_book_repository.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_tech_task/features/notification/data/repositories/i_notification_repository.dart';
import 'package:flutter_tech_task/features/notification/data/services/i_notification_local_service.dart';
import 'package:flutter_tech_task/features/notification/data/services/notification_local_service.dart';
import 'package:flutter_tech_task/features/notification/domain/repositories/notification_repository.dart';
import 'package:flutter_tech_task/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:flutter_tech_task/helper/network/internet_connection_check/internet_connection_check_helper.dart';
import 'package:get_it/get_it.dart';

final _serviceLocator = GetIt.instance;

Future<void> initalize() async {
  //# Network Connection
  _serviceLocator.registerLazySingleton<InternetConnectionCheckerHelper>(
    () => InternetConnectionCheckerHelper(),
  );

  _serviceLocator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Application.apiBaseUrl,
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    ),
  );

//# Network Client
  await _serviceLocator
    ..registerLazySingleton(
      () => NetworkClient(
        dio: _serviceLocator<Dio>(),
        connectionCheckHelper:
            _serviceLocator<InternetConnectionCheckerHelper>(),
      ),
    )

    // #Theme
    ..registerLazySingleton<IThemeLocalService>(() => ThemeLocalService())
    ..registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(_serviceLocator<IThemeLocalService>()),
    )

    // #Favorites
    ..registerLazySingleton<IFavoritesLocalService>(
        () => FavoritesLocalService())
    ..registerLazySingleton<IFavoritesRepository>(
        () => FavoritesRepository(_serviceLocator<IFavoritesLocalService>()))
    ..registerLazySingleton<FavoritesCubit>(
        () => FavoritesCubit(_serviceLocator<IFavoritesRepository>()))

    // #Notifications
    ..registerLazySingleton<INotificationLocalService>(
        () => NotificationLocalService())
    ..registerLazySingleton<INotificationRepository>(() =>
        NotificationRepository(_serviceLocator<INotificationLocalService>()))
    ..registerLazySingleton<NotificationCubit>(
        () => NotificationCubit(_serviceLocator<INotificationRepository>()))

    // #Book
    ..registerLazySingleton<IBookService>(
        () => BookService(_serviceLocator<NetworkClient>()))
    ..registerLazySingleton<IBookLocalService>(() => BookLocalService())
    ..registerLazySingleton<IBookRepository>(() => BookRepository(
          _serviceLocator<IBookService>(),
          _serviceLocator<IBookLocalService>(),
          _serviceLocator<InternetConnectionCheckerHelper>(),
        ))

    // #Home
    ..registerLazySingleton<HomeCubit>(
      () => HomeCubit(_serviceLocator<IBookRepository>()),
    )

    // #Book Detail
    ..registerLazySingleton<BookDetailCubit>(
      () => BookDetailCubit(_serviceLocator<IBookRepository>()),
    );

  await _initializeOtherDependencies();

  AppLogger.call(title: 'Service Locator Initialized');
}

Future<void> _initializeOtherDependencies() async {
  await provide<IThemeLocalService>().initialize();
  await provide<ThemeCubit>().initialize();
  await provide<IBookLocalService>().initialize();
  await provide<IFavoritesLocalService>().initialize();
  await provide<FavoritesCubit>().initialize();
  await provide<INotificationLocalService>().initialize();
  await provide<NotificationCubit>().initialize();
}

T provide<T extends Object>() {
  return _serviceLocator<T>();
}
