import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/cubit/theme/theme_cubit.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:provider/single_child_widget.dart';

class AppBlocProvider {
  static List<SingleChildWidget> _appBlocs = [
    /// Burdan provide edilen bloc'lar uygulama başlangıcında widget tree'nin en üstüne yerleşecektir.

    /// Instance üretimini bloc kütüphanesine yaptırmak yerine
    /// Instance'ı biz veriyoruz. Bununla birlikte Instance'ın yönetimi
    /// tamamen bize bırakılmış oluyor. Bloc kütüphanesi müdahale etmiyor.

    // BlocProvider.value(
    //   value: ServiceLocatorProvider.provide<Cubit>(),
    // ),

    /// Instance üretimini ve yönetimini bloc kütüphanesine bırakıyoruz.

    /// Instance: Bloc yapısı ve Widget Tree tarafında kullanılan instancedır.
    /// Class bazlı olarak Instance buraya dahil değildir.

    // BlocProvider(
    //   create: (context) => Cubit(
    //       ServiceLocatorProvider.provide<Cubit>()),
    // ),

    BlocProvider.value(
      value: ServiceLocatorProvider.provide<ThemeCubit>(),
    ),
  ];

  static List<SingleChildWidget> getMainBlocProviderList() => _appBlocs;
}
