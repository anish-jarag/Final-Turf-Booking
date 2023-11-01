
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/admin_login.dart';
import 'package:myapp/home_screen.dart';

import '../api/apis.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size mq;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));

      if (APIs.auth.currentUser != null) {
        //For printing user detail
        log('User : ${APIs.auth.currentUser}');

        //navigate to home screen
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        //navigate to login screen
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AdminLoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Media query for sizing
    mq = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Welcome to Chat"),
      // ),
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .20,
              width: mq.width * .50,
              left: mq.width * .25,
              child:Text("Helo")),
          Positioned(
              bottom: mq.height * .10,
              width: mq.width * .9,
              left: mq.width * .05,
              height: mq.height * .06,
              child: const Column(
                children: [
                  Text(" "),
                  Text(
                    "Welcome to Turf Booking App",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}