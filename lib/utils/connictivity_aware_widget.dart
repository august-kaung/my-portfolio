import '../../import.dart';


class ConnectivityAwareWidget extends StatefulWidget {
  final Widget child;

  const ConnectivityAwareWidget({super.key, required this.child});

  @override
  State<ConnectivityAwareWidget> createState() =>
      _ConnectivityAwareWidgetState();
}

class _ConnectivityAwareWidgetState extends State<ConnectivityAwareWidget> {
  bool showAlertDialog = false;
  bool isShowing = false;
  StreamSubscription<ConnectivityResult> _subscription =
      Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult connectivityResult) {},
          );

  @override
  void initState() {
    super.initState();
    ConnectivityService connectivityService =
        Provider.of<ConnectivityService>(context, listen: false);
    ConnectivityStatus initialConnectivity =
        connectivityService.connectivityStatus;
    showAlertDialog = initialConnectivity.index == 0 ? true : false;
    _subscription = connectivityService.connectivity.onConnectivityChanged
        .listen(_onConnectivityChanged);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _onConnectivityChanged(ConnectivityResult connectivityResult) {
    showAlertDialog = (connectivityResult == ConnectivityResult.none);
    if (!isShowing) {
      setState(() {
        showAlertDialog
            ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                    EasyText(text: "Please check your internet connection.")))
            : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
