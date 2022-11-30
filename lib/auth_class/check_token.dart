import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashboard.dart';
import '../screens/home_screen.dart';

class CheeckAuth extends StatefulWidget {
  const CheeckAuth({super.key});

  @override
  State<CheeckAuth> createState() => _CheeckAuthState();
}

class _CheeckAuthState extends State<CheeckAuth> {

bool isAuth = false;

  _checkTokenData() async{
     final storaged = await SharedPreferences.getInstance();
     final  token = storaged.getString("auth_token");
     if(token != null){
      setState(() {
        isAuth = true;
      });
     }
  }

  @override
  void initState() {
    _checkTokenData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(isAuth){
return const DashboardScreen();
    }else{
return const HomeScreen();
    }
  }
}
