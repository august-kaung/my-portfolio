import '../../import.dart';
 

class ConnectivityService extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  ConnectivityStatus _connectivityStatus = ConnectivityStatus.none;

  ConnectivityStatus get connectivityStatus => _connectivityStatus;

  void initialize() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);

    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        _connectivityStatus = ConnectivityStatus.wifi;
        break;
      case ConnectivityResult.mobile:
        _connectivityStatus = ConnectivityStatus.mobile;
        break;
      case ConnectivityResult.ethernet:
        _connectivityStatus = ConnectivityStatus.ethernet;
        break;
      case ConnectivityResult.none:
        _connectivityStatus = ConnectivityStatus.none;
        break;
      default:
        _connectivityStatus = ConnectivityStatus.other;
    }

    notifyListeners();
  }
}
