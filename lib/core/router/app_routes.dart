import 'package:collection/collection.dart';

enum AppRoutes {
  Home('/'),
  BookDetail('/bookDetail/:id'),
  Settings('/settings');

  const AppRoutes(this.path);
  final String path;
}

extension AppRoutesStringExtension on String {
  AppRoutes get getAppRoute {
    AppRoutes? appRoute =
        AppRoutes.values.firstWhereOrNull((route) => route.path == this) ??
            AppRoutes.Home;

    return appRoute;
  }
}
