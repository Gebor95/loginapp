import 'package:flutter/material.dart';
import 'package:loginapp/auth_class/check_token.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
          ()=>Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => const CheeckAuth()
           )
          )
         );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
            alignment: Alignment.center,
            clipBehavior:  Clip.none,
            child: Image.asset("assets/images/icon.png", scale: 24.0,),
          ),
        ],
      ),
    );
  }
}