import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/core/router/app_route_effect.dart';
import 'package:flutter_tech_task/core/router/app_route_observer_mixin.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:flutter_tech_task/core/router/transition_builder.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/cubit/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/view/book_detail_view.dart';
import 'package:flutter_tech_task/features/bottom_bar/view/bottom_bar_view.dart';
import 'package:flutter_tech_task/features/favorites/presentation/view/favorites_view.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_tech_task/features/home/presentation/view/home_view.dart';
import 'package:flutter_tech_task/features/settings/presentation/view/settings_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: Application.navigatorKey,
    initialLocation: AppRoutes.Home.path,
    observers: [
      appRouteObserver,
      // FirebaseAnalyticsHelper.navigatorObserver,
      // ChuckerFlutter.navigatorObserver,
    ],
    debugLogDiagnostics: false,
    routes: [
      ShellRoute(
          navigatorKey: Application.shellNavigatorKey,
          builder: (context, state, navigationShell) {
            return BottomBarView(
              navigationShell: navigationShell,
            );
          },
          routes: [
            _generateGoRoute(
                route: AppRoutes.Home.path,
                isShellRoute: true,
                view: (parameter) => HomeView(),
                routeEffect: AppRouteEffect.none,
                blocProviders: [
                  BlocProvider.value(
                      value: ServiceLocatorProvider.provide<HomeCubit>())
                ]),
            _generateGoRoute(
              route: AppRoutes.Favorites.path,
              isShellRoute: true,
              view: (parameter) => FavoritesView(),
              routeEffect: AppRouteEffect.none,
            ),
            _generateGoRoute(
              route: AppRoutes.Settings.path,
              isShellRoute: true,
              view: (parameter) => SettingsView(),
              routeEffect: AppRouteEffect.none,
            ),
          ]),
      _generateGoRoute(
          route: AppRoutes.BookDetail.path,
          view: (parameter) => BookDetailView(bookId: parameter['id']),
          blocProviders: [
            BlocProvider.value(
                value: ServiceLocatorProvider.provide<BookDetailCubit>()),
          ]),
    ],
    redirect: (context, state) async {
      AppLogger.call(title: 'Go Router Redirect', value: state.matchedLocation);

      /// Sample App Initialize with token

      // if (state.matchedLocation == AppRoutes.OnBoarding.path) {
      //   final IAuthLocalService _loginLocalService =
      //       ServiceLocatorProvider.provide<IAuthLocalService>();

      //   final _loginEntity =
      //       await _loginLocalService.get(CacheConstants.AccessToken.name);

      //   if (_loginEntity != null) {
      //     return AppRoutes.Home.path;
      //   }
      // }

      // FirebaseAnalyticsHelper.logScreenView(state.matchedLocation);

      return null;
    },
  );

  static GoRoute _generateGoRoute<View extends Widget>({
    required String route,
    required View view(dynamic parameter),
    List<SingleChildWidget>? blocProviders,
    List<RouteBase>? subRoutes,
    AppRouteEffect? routeEffect,
    bool isShellRoute = false,
  }) {
    GlobalKey<NavigatorState>? parentNavigatorKey = isShellRoute == true
        ? Application.shellNavigatorKey
        : Application.navigatorKey;

    return GoRoute(
      name: route,
      path: route,
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        dynamic argumentExtra;
        if (state.extra.isNotNull) {
          argumentExtra = state.extra;
        }
        if (state.pathParameters.isNotNullOrEmpty) {
          argumentExtra = state.pathParameters;
        }

        Widget child = blocProviders != null
            ? MultiBlocProvider(
                providers: blocProviders,
                child: view(argumentExtra),
              )
            : view(argumentExtra);

        if (routeEffect != null) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: child,
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return PageRouteTransitionBuilder.transitionsBuilder(
                context,
                animation,
                secondaryAnimation,
                child,
                effect: routeEffect,
              );
            },
          );
        } else {
          return MaterialPage(child: child);
        }
      },
      routes: subRoutes ?? [],
    );
  }

  static goNamed(String routeName,
      {Object? extra, Map<String, String>? pathParameters}) {
    router.goNamed(routeName,
        extra: extra, pathParameters: pathParameters ?? {});
  }

  static Future<bool?> navigatePushNamed(String routeName,
      {Object? extra, Map<String, String>? pathParameters}) async {
    return router.pushNamed(routeName,
        extra: extra, pathParameters: pathParameters ?? {});
  }

  static navigatePushReplacementNamed(String routeName, {Object? extra}) {
    router.pushReplacementNamed(routeName, extra: extra);
  }

  static pop({dynamic value}) {
    return router.pop(value);
  }

  static String? currentRoute(BuildContext context) {
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    return location;
  }
}
