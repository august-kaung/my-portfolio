// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkState extends StateNotifier<ConnectivityResult> {
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _streamSubscription;

//   NetworkState() : super(ConnectivityResult.none) {
//     _initConnectivity();
//     _streamSubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _initConnectivity() async {
//     state = await _connectivity.checkConnectivity();
//   }

//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     state = connectivityResult;
//   }

//   @override
//   void dispose() {
//     _streamSubscription.cancel();
//     super.dispose();
//   }
// }
