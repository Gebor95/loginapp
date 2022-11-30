

import 'package:flutter/material.dart';
import 'package:loginapp/screens/localstorage.dart';
import 'package:loginapp/screens/splash.dart';
//import 'package:loginapp/screens/localstorage.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //var token = LocalStorage().fetchToken().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions:  [GestureDetector(onTap:(){LocalStorage().logoff(); Navigator.push(context, MaterialPageRoute(builder: (context)=> const SplashScreen()));}, child: const Icon(Icons.exit_to_app))],
      ),
      body: const Center(
        child: Text("bro fetch token"),
      ),
    );
  }
}