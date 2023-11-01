import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/api/apis.dart';
import 'package:myapp/dialouges/dialogs.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/utils.dart';





class AdminLoginScreen extends StatefulWidget {
  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {

  HandleGoogleBtnClick() {
    //showing loder
    Dialouges.ShowLoder(context);
    signInWithGoogle().then((user) async {
      //hiding Loder
      Navigator.pop(context);
      if (user != null) {
        //printing user detail
        log('User : ${user.user}');
        log('User Additional Info : ${user.additionalUserInfo}');

        if (await (APIs.userExist())) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          });
        }
      }
    }
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('signInWithGoogle: $e');
      // ignore: use_build_context_synchronously
      Dialouges.showSnackbar(
          context, "Something Went Wrong Check Your Internet Connection..!");
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // adminlogin2B2 (9:192)
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 45 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf6f6),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/a76a83784a5a455adc1603b4e906c3-1-bg-rX2.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupg3jygFa (MnX94sJvFcWg3v3VHTg3jy)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 81 * fem),
              width: 393 * fem,
              height: 287 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // eclipsenZW (9:194)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 259 * fem,
                        height: 287 * fem,
                        child: Image.asset(
                          'assets/images/eclipse-Pc4.png',
                          width: 259 * fem,
                          height: 287 * fem,
                        ),
                      ),
                    ),
                  ),
                
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 171 * fem,
                      height: 36 * fem,
                      child: Text(
                        'Admin Sign In',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5 * ffem / fem,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                 
                ],
              ),
            ),
          
            SizedBox(
              width: 350,
                  height: 60,
          
              child: ElevatedButton(
                onPressed: () async {
            
                  await HandleGoogleBtnClick();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xff1cbe97),
                  elevation: 4, 
                  shape: RoundedRectangleBorder(
              
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                  
                    Container(
 
                  width: 45 * fem,
                  height: 45 * fem,
                  child: Image.asset(
                    'assets/images/logogooglegicon-2-ci4.png',
                    fit: BoxFit.cover,
                  ),
                ),
                  Center(
                      child: Text(
                        'Sign in With Google ',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
