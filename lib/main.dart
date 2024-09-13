import 'package:firebase_core/firebase_core.dart';

import '../import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDpF8bYegRl-kHjwOwd9FuyaWO9EXrMXRM",
            authDomain: "myportfolio-d69ac.firebaseapp.com",
            projectId: "myportfolio-d69ac",
            storageBucket: "myportfolio-d69ac.appspot.com",
            messagingSenderId: "500405302337",
            appId: "1:500405302337:web:fa11d4b2f00b51034d82c0",
            measurementId: "G-EJ9SNN0LER"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaung Htet\'s Portfolio',
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomePageProvider>(
              create: (_) => HomePageProvider()),
        ],
        child: const MainPage(),
      ),
    );
  }
}
