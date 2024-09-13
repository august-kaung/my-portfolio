import 'package:my_portfolio/import.dart';

class HomePageProvider extends ChangeNotifier {
  String fullText = kGreetingText;
  String currentText = "";
  int index = 0;
  bool isDeleting = false;
  Timer? timer;

  void startTyping() {
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (isDeleting) {
        if (currentText.isNotEmpty) {
          currentText = currentText.substring(0, currentText.length - 1);
        } else {
          isDeleting = false;
          index = 0;
        }
      } else {
        if (index < fullText.length) {
          currentText += fullText[index];
          index++;
        } else {
          isDeleting = true;
        }
      }
      notifyListeners();
    });
  }
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration:const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }
}
