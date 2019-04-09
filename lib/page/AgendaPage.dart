import 'package:flutter/material.dart';
import 'package:go_for_israel/utils/Strings.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemBuilder: (context, index) => getItemListBuilder()));
  }
}

Widget getItemListBuilder(){
  return Column(children: <Widget>[
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: IsraelColors.lineAgenda))),
      alignment: Alignment.center,
        child:Text(
          Strings.DATA_AGENDA,
          style: TextStyle(
              color: IsraelColors.textDstsAgenda, fontSize: 18.0, fontWeight: FontWeight.w700)
        ),
    height: 40,
        width: double.infinity),
    Column(children: <Widget>[
      getItem(false),
      getItem(true),
      getItem(true),
      getItem(false)

    ],)
  ]);
}

Widget getItem(bool isColor){
  return Container(
    decoration: BoxDecoration(color: isColor ? Colors.white : IsraelColors.profileBackgroundColor,border: Border(bottom: BorderSide(color: IsraelColors.lineAgenda))),
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(Strings.TIME_AGENDA, style: TextStyle(color:Colors.black, fontSize: 14, fontWeight:FontWeight.w400 )),
            Spacer(),
            Image.asset("assets/agenda.png", color: Colors.blue,width: 24,)
          ]),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,children: <Widget>[
          Text(Strings.NAME_FOR_AGENDA, style: TextStyle(color: IsraelColors.headlinesAgenda,fontWeight: FontWeight.w500,fontSize: 16),),
          Text(Strings.TEXT_FOR_AGENDA, style: TextStyle(height: 1.5),)
        ])
      ])
  );
}