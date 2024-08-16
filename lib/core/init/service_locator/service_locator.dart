import 'package:dio/dio.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/services/i_theme_local_service.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/services/theme_local_service.dart';
import 'package:flutter_tech_task/common/cubit/theme/theme_cubit.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/network/http_client/manager/network_client.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/cubit/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/home/data/services/book_service.dart';
import 'package:flutter_tech_task/features/home/data/services/i_book_service.dart';
import 'package:flutter_tech_task/features/home/domain/repositories/book_repository.dart';
import 'package:flutter_tech_task/features/home/domain/repositories/i_book_repository.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
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

    // #Book
    ..registerLazySingleton<IBookService>(
        () => BookService(_serviceLocator<NetworkClient>()))
    ..registerLazySingleton<IBookRepository>(
        () => BookRepository(_serviceLocator<IBookService>()))

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
}

T provide<T extends Object>() {
  return _serviceLocator<T>();
}
