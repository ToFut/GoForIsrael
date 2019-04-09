import 'package:flutter/material.dart';
import 'package:go_for_israel/page/ProfilePage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';

class SponsoresPage extends StatefulWidget{
  _SponsoresPageState createState()=> _SponsoresPageState();
}

class _SponsoresPageState extends State<SponsoresPage>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(backgroundColor: IsraelColors.mainColor,
        title:Text("Sponsores",style: TextStyle(fontSize: 20)) ,
      centerTitle: true,),
      body: Container(
        height: double.infinity,
        color: IsraelColors.lineAgenda,
        padding: EdgeInsets.all(20),
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Co-organaized & Sponsored By:",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: IsraelColors.bottomAppBarTextColor)
            ),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 2,bottom: 5),
                padding: EdgeInsets.all(20),
                child:Row(
                    children: <Widget>[
                      Spacer(),
                      Image.asset("assets/1_sponsores.png"),
                      Spacer()
                    ])),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 5,bottom: 2),
                padding:EdgeInsets.all(20),
                child:Row(children: <Widget>[
                  Spacer(),
                  Image.asset("assets/2_sponsores.png"),
                  Spacer()])),
            Text("Silver Sponsors",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: IsraelColors.bottomAppBarTextColor)
            ),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 2,bottom: 5),
                padding:EdgeInsets.all(20),
                child: Row(children: <Widget>[
                  Spacer(),
                  Image.asset("assets/3_sponsores.png"),
                  Spacer()
                ])),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 5,bottom: 2),
                padding:EdgeInsets.all(20),
                child: Row(children: <Widget>[
                  Spacer(),
                  Image.asset("assets/4_sponsores.png"),
                Spacer()])),
            Text("Bronze Sponsors",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: IsraelColors.bottomAppBarTextColor)
            ),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 2,bottom: 5),
                padding:EdgeInsets.all(20),
                child: Row(children: <Widget>[
                  Spacer(),
                  Image.asset("assets/5_sponsores.png"),
                  Spacer()
                ])),
            Container(
                color:Colors.white,
                margin: EdgeInsets.only(top: 5,bottom: 2),
                padding:EdgeInsets.all(20),
                child:Row(children: <Widget>[
                  Spacer(),
                  Image.asset("assets/6_sponsores.png"),
                  Spacer()
                ]) )]
        )),
    ));
  }
}