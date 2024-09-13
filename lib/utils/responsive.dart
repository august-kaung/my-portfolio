import '../../import.dart';


class ResponsiveUtils {
  static bool checkDevice(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 500;
    return useMobileLayout;
  }

  static bool checkPortrait(BuildContext context) {
    final bool hasPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return hasPortrait;
  }

  static int getCartItemCount(BuildContext context) {
    int count = 3;
    //? temp
    // double width = screenWidth(context);
    // if (width > 1024) {
    //   count = 4;
    // }
    return count;
  }

  static int getSaleListShowCount(BuildContext context) {
    int count = 8;
    double width = screenWidth(context);
    if (width > 1024) {
      count = 10;
    }
    return count;
  }

  static double getTextScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaler.scale(1.0);
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenHeightMultiply(BuildContext context,
      {double multiplyBy = 1}) {
    return screenHeight(context) * multiplyBy;
  }

  static double screenWidthMultiply(BuildContext context,
      {double multiplyBy = 1}) {
    return screenWidth(context) * multiplyBy;
  }

  static getTextwithTitle(useMobileLayout, title, context) {
    return EasyText(
        text: title,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: useMobileLayout ? 12 : 18);

    //  Text("$title",
    //     textScaler: const TextScaler.linear(1.0),
    //     style: TextStyle(
    //         fontWeight: FontWeight.w500,
    //         // color: Theme.of(context).primaryColor,
    //         color: kKeyDark,
    //         fontSize: useMobileLayout ? 20 : 30));
  }
}
