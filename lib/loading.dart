import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'Screens/Login/login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loading(),
  ));
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E262A),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child:  Image.asset("lib/assets/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}