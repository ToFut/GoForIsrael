import 'package:flutter/material.dart';
import 'package:go_for_israel/page/SponsoresPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';

class MorePage extends StatefulWidget{
  @override
  _MorePageState createState() => _MorePageState();
}
class _MorePageState extends State<MorePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: IsraelColors.lineAgenda),
          child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left:20,right: 20,bottom: 20,top: 50),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(color: Colors.white),
                    child:GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SponsoresPage()));},
                    child: Row(children: <Widget>[
                      Image.asset("assets/sponsores_icon.png"),
                      SizedBox(width: 25),
                      Text("Sponsores",
                          style: TextStyle(
                              color: IsraelColors.mainTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18))
                    ]))),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Colors.white),
                    child:GestureDetector(onTap: (){},
                        child: Row(children: <Widget>[
                          Image.asset("assets/contact_organaizer.png"),
                          SizedBox(width: 25),
                          Text("Contact Organaizer",
                              style: TextStyle(
                                  color: IsraelColors.mainTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18))
                        ]))),
                Container(
                  margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Colors.white),
                    child:GestureDetector(onTap: (){},
                        child: Row(children: <Widget>[
                          Image.asset("assets/conferense_guide.png"),
                          SizedBox(width: 25),
                          Text("Corferense Guide",
                              style: TextStyle(color: IsraelColors.mainTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18))
                        ])))

                ])),
    );
  }
}