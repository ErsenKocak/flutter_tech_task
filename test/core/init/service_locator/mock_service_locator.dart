import 'package:dio/dio.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/features/home/data/repositories/i_book_repository.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_tech_task/helper/network/internet_connection_check/internet_connection_check_helper.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/repositories/repositories/i_mock_book_repository.dart';

import '../../../features/home/data/services/remote/mock_book_service.dart';
import '../../../features/home/data/services/remote/i_mock_book_service.dart';
import '../../../features/home/domain/repositories/mock_book_repository.dart';
import '../../manager/mock_network_client.dart';
import '../../model/mock_cancel_token.dart';

final _mockServiceLocator = GetIt.instance;

Future<void> initalize() async {
  //# Network Connection
  _mockServiceLocator.registerLazySingleton<InternetConnectionCheckerHelper>(
    () => InternetConnectionCheckerHelper(),
  );

  _mockServiceLocator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://stephen-king-api.onrender.com/api',
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    ),
  );

//# Network Client
  await _mockServiceLocator
    ..registerLazySingleton(
      () => MockNetworkClient(
        dio: _mockServiceLocator<Dio>(),
      ),
    )

    // #Book
    ..registerLazySingleton<IMockBookService>(
        () => MockBookService(_mockServiceLocator<MockNetworkClient>()))
    ..registerLazySingleton<IMockBookRepository>(() => MockBookRepository(
          _mockServiceLocator<IMockBookService>(),
        ))
    // #Home
    ..registerLazySingleton<HomeCubit>(
      () => HomeCubit(_mockServiceLocator<IBookRepository>()),
    );

  await _initializeOtherDependencies();

  AppLogger.call(title: 'Service Locator Initialized');
}

Future<void> _initializeOtherDependencies() async {
  MockAppCancelToken.initialize();
}

T provide<T extends Object>() {
  return _mockServiceLocator<T>();
}
