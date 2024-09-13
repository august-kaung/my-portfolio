import '../../import.dart';
 

class FontTypography {
  static double getFontSizeByDevice(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    fontSize = fontSize / 1.2;

    if (screenWidth >= 1880) {
      return fontSize + 12;
    } else if (screenWidth >= 1350 && screenWidth < 1880) {
      return fontSize + 6;
    } else if (screenWidth >= 1280 && screenWidth < 1350) {
      return fontSize + 3;
    } else if (screenWidth >= 1024 && screenWidth < 1280) {
      return fontSize + 1;
    } else if (screenWidth >= 800 && screenWidth < 1024) {
      

      return fontSize - 2;
    } else if (screenWidth >= 600 && screenWidth < 800) {
      return fontSize - 4;
    } else {
      return fontSize - 6;
    }
  }
}
