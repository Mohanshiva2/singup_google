import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:singup_google/login_screen.dart';
import 'package:singup_google/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false ,
      home: LoginScreen(),
    );
  }
}




