import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCheckerHelper {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  bool isPopUpOpen = false;

  void initializeConnectivityStream() {
    _connectivity.onConnectivityChanged.listen(
      (event) {
        if (_connectionStatus == ConnectivityResult.none) {
          if (isPopUpOpen == false) {
            // SHOW POPUP
            isPopUpOpen = true;
          }
        } else {
          checkConnectivity();
        }
      },
    );
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final bool isConnected = await InternetConnectionChecker().hasConnection;
      return isConnected;
    } else {
      final bool isConnected = await InternetConnectionChecker().hasConnection;
      return isConnected;
    }
  }
}
