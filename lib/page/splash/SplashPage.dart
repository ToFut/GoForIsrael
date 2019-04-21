import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_for_israel/base/SharedPrefModule.dart';
import 'package:go_for_israel/model/UserModel.dart';
import 'package:go_for_israel/page/login_page/LoginPage.dart';
import 'package:go_for_israel/utils/Router.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
Timer timer;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _startTimer(context);
    return Scaffold(
        body: Image.asset("assets/splash_screen.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height)
    );
  }


@override
void dispose() {
  timer.cancel();
  super.dispose();
}

_startTimer(BuildContext context) async{
  //UserModel user = await SharedPrefModule.getUserModel();
  timer = Timer(Duration(seconds: 2), () {
    Navigator.pushReplacement(context, Router(
      builder: (context) => LoginPage(),
    ));
  });
}
}

