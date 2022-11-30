import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage{
  storeToken(String token) async{
    var storaged = await SharedPreferences.getInstance();
    await storaged.setString("auth_token", jsonEncode(token));
  }
  Future<String?> fetchToken() async{
    final storaged = await SharedPreferences.getInstance();
    return storaged.getString(jsonDecode("auth_token"));
  }

  logoff() async{
    final storaged = await SharedPreferences.getInstance();
    await storaged.remove("auth_token");
  }
}