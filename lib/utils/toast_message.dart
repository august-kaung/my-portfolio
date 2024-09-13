import '../../import.dart';
 

//? success ,green ,1
//? error ,red ,2
//? info ,blue ,3
//? warning ,amber ,4

class ToastMessage extends StatefulWidget {
  final String message;
  final int color;
  const ToastMessage({
    super.key,
    required this.message,
    required this.color,
  });

  @override
  State<ToastMessage> createState() => _ToastMessageState();
}

class _ToastMessageState extends State<ToastMessage> {
  getIcon() {
    switch (widget.color) {
      case 1:
        return const Icon(
          Icons.check_circle,
          color: Colors.black,
        );
      case 2:
        return const Icon(
          Icons.error,
          color: Colors.black,
        );

      case 3:
        return const Icon(
          Icons.info,
          color: Colors.black,
        );
      case 4:
        return const Icon(
          Icons.warning,
          color: Colors.black,
        );

      default:
    }
  }

  getColor() {
    switch (widget.color) {
      case 1:
        return const Color.fromARGB(255, 0, 255, 8);

      case 2:
        return const Color.fromARGB(255, 255, 17, 0);

      case 3:
        return const Color.fromARGB(255, 255, 191, 0);
      case 4:
        return const Color.fromARGB(255, 255, 191, 0);

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: width,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: getColor(),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  getIcon(),
                  const SizedBox(
                    width: 10.0,
                  ),
                  EasyText(
                    text: widget.message,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
