import 'package:flutter/material.dart';

class ConferenceBookPage extends StatefulWidget {
  @override
  _ConferenceBookPageState createState() => _ConferenceBookPageState();
}

class _ConferenceBookPageState extends State<ConferenceBookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: ListView.builder(itemBuilder: (context, index) {
          return getItem();
      },itemCount: 2),
    ));
  }
}

Widget getItem() {
    return Container(
      child: Image.asset("assets/conference.png", fit: BoxFit.cover),
    );
}
