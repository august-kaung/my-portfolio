 
import '../../import.dart';
 

class DeviceInfo {
  Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
   //   WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return "6ba8e3ac-8a18-44c5-bfa6-eb6e8415550e";
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    }
  }
}
