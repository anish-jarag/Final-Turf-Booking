import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/apis.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/profile_screen.dart';
import 'package:myapp/spashscreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: SettingScreen(userId: APIs.auth.currentUser!.uid,)
      home: SplashScreen(),
    );
  }
}

_initializeFirebase() async {
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}