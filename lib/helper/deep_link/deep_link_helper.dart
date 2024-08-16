// import 'package:app_links/app_links.dart';
// import 'package:chainly/core/router/app_router.dart';
// import 'package:chainly/core/router/app_routes.dart';

// class DeepLinkHelper {
//   static final _appLinks = AppLinks();
//   static initialize() {
//     _uriLinkListener();
//   }

//   static void _uriLinkListener() {
//     _appLinks.uriLinkStream.listen((event) {
//       _navigateScreen(queryParameters: event.queryParameters);
//     });
//   }

//   static _navigateScreen({Map<String, String>? queryParameters}) {
//     String? navigationUrl = queryParameters?['navigationUrl'];

//     if (queryParameters != null && navigationUrl != null) {
//       AppRouter.goNamed(
//         AppRoutesStringExtension(navigationUrl).getAppRoute.path,
//       );
//     }
//   }
// }

/// Go Router kendi içerisinde DeepLink desteklediği için kapatılmıştır.
/// İhtiyaç halinda açılabilir.
/// queryParameters parse ve yönlendirme işlemleri için extension yazılabilir.
