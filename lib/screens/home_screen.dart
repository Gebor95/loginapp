// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/screens/dashboard.dart';
import 'package:loginapp/screens/localstorage.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
 final TextEditingController pwordController = TextEditingController();

 loginusrrqt() async{
  var data ={
    "username":emailController.text,
    "password":pwordController.text,
    "action":"balance",
  };
  final response = await http.post(Uri.parse("https://reqres.in/api/login/"), body: data);
  if(response.statusCode == 200){
    var data =jsonDecode(response.body);
     LocalStorage().storeToken(data['token']);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DashboardScreen()));
  }

  else{
    print(response.body);
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        title: Image.asset("assets/images/logo.png", scale: 2.0,),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(height: 70),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(150),
                ),
                child: const Icon(Icons.person, size: 140.4, color: Colors.white38,),
              ),
              
            ),
            const SizedBox(height: 60,),
            Container(
               alignment: Alignment.center,
               width: 300,
              child: TextFormField(
                controller: emailController,
               decoration: const InputDecoration(
                label: Text("Username")
               ), 
              ),
            ),
               const SizedBox(height: 30,),
             Container(
              width: 300,
               alignment: Alignment.center,
              child: TextFormField(
                controller: pwordController,
               decoration: const InputDecoration(
                label: Text("Password")
               ), 
              ),
            ),
          const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              loginusrrqt();
            }, child: const Text("Log in account"),),
            
          ],
        ),
      ),
    );
  }
}