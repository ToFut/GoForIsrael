import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

bool isBackground = true;

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();

}

class _SchedulePageState extends State<SchedulePage> {
     @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context, index) {
        return getItem(Strings.TIME_AGENDA, context);
    }
    );
  }
}

Widget getItem(String time, BuildContext context) {
    isBackground = !isBackground;
  return Container(
    padding: EdgeInsets.all(20),
    color: isBackground ? IsraelColors.sheduleColoLight : IsraelColors.sheduleColorDark,
    child: Column(
     children: <Widget>[
       Row(
         children: <Widget>[
          Image.asset("assets/icon_calendar.png", height: 30, width: 30),
           SizedBox(width:10),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(time),
               Text(Strings.MEETING_WITH_JHON,
                 style: TextStyle(
                     color: IsraelColors.mainTextColor,
                     fontSize: 14.0,
                     fontWeight: FontWeight.w700),)
             ],
           )
         ]
       ),
       Container(
         margin: EdgeInsets.only(top: 15.0,bottom: 15),
         padding: EdgeInsets.all(21),
         color: Colors.white,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text(Strings.SHEDULE_TEXT,
                 style: TextStyle(
                     color: Color(0xff95a5a6),
                     height: 1)),
             Text("contact@contactme.com", textAlign: TextAlign.start,style: TextStyle(color: IsraelColors.mainTextColor),),
             isBackground ? Column(children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top: 10, bottom: 10),
                 width: double.infinity,
                 height: 1,
                 color: IsraelColors.lineAgenda,
               ),
               Row(
                 children: <Widget>[
                   getButton(Strings.CHANGE, context),
                   SizedBox(width: 10),
                   getButton(Strings.CANSEL_MEETING, context),
                   SizedBox(width: 10),
                   getButton(Strings.CHAT, context),
                   SizedBox(width: 10),
                   getButton(Strings.NEW_MEETING, context)
                 ],
               )
             ]) : Container()
           ],
         ),
       ),
       !isBackground ? Container(
         child: Row(
           children: <Widget>[
              Expanded(child: Image.asset("assets/icon_time.png", width: 20, height: 20), flex: 1),
              Expanded(child: Image.asset("assets/icon_close.png", width: 20, height: 20), flex: 1),
              Expanded(child: Image.asset("assets/icon_chat.png", width: 20, height: 20), flex: 1),
              Expanded(child: Image.asset("assets/icon_group.png", width: 20, height: 20), flex: 1)
           ],
         ),
       ) : Container()
     ],
    )
  );
  
}


Widget getButton(String text, BuildContext context) {
  return Expanded(
      child: RaisedButton(
        child: Text(text,
            style: TextStyle(fontSize: 9),
            textAlign: TextAlign.center),
        onPressed: () {
          if(text == Strings.NEW_MEETING) {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height - 350,
                    child: Column(children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: IsraelColors.lineAgenda)
                            )),
                          child:Row(
                              children: <Widget>[
                        Icon(Icons.event,color: IsraelColors.headlinesAgenda,size: 27),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text(Strings.TIME_AGENDA,style: TextStyle(color: IsraelColors.companiesTextColor),),
                          Text(Strings.MEETING_WITH_JHON,style: TextStyle(color: IsraelColors.headlinesAgenda),)]
                        )])),
                      Container(
                        padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: IsraelColors.lineAgenda))),
                          child:Row(
                              children: <Widget>[
                                Icon(Icons.access_time,
                                    color: IsraelColors.headlinesAgenda,
                                    size: 21),
                                SizedBox(width: 10),
                                Text(Strings.TIME_AGENDA,
                                    style: TextStyle(
                                        color: IsraelColors.headlinesAgenda)),
                                Spacer(),
                                Container(
                                    width: 80,height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: IsraelColors.headlinesAgenda)),
                                    child: FlatButton(
                                        onPressed: null,
                                        child: Text("Change",style: TextStyle(color: IsraelColors.headlinesAgenda, fontSize: 12))))]
                      )),
                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: IsraelColors.lineAgenda))),
                          child: Row(
                              children: <Widget>[
                                Icon(Icons.event,
                                    color: IsraelColors.headlinesAgenda,
                                    size: 21),
                                SizedBox(width: 10),
                                Text("Date 25/05/2019",
                                    style: TextStyle(
                                        color: IsraelColors.headlinesAgenda)),
                                Spacer(),
                                Container(width: 80,height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: IsraelColors.headlinesAgenda)),
                                    child:FlatButton(
                                        onPressed: null,
                                        child: Text("Change",
                                            style: TextStyle(
                                                color: IsraelColors.headlinesAgenda,
                                                fontSize: 12)
                                        ))
                                )]
                      )),
                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                                color: IsraelColors.lineAgenda))),
                          child:Row(
                              children: <Widget>[
                                Icon(Icons.place,
                                    color: IsraelColors.headlinesAgenda,
                                    size: 21),
                                SizedBox(width: 10),
                                Text("Hilton, Yel Aviv",
                                    style: TextStyle(
                                        color: IsraelColors.headlinesAgenda)),
                                Spacer(),
                                Container(width: 80,height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: IsraelColors.headlinesAgenda)),
                                    child: FlatButton(
                                        onPressed: null,
                                        child: Text("Change",
                                            style: TextStyle(color: IsraelColors.headlinesAgenda,
                                                fontSize: 12))
                                    ))]))]
                    )),
                actions: <Widget>[
                     Row(
                    children: <Widget>[
                  FloatingActionButton(
                      backgroundColor:Colors.white,
                      onPressed: (){},
                      child: Icon(Icons.close,
                          color: IsraelColors.headlinesAgenda,
                          size: 16)),
                  SizedBox(width: 20),
                  FloatingActionButton(
                      backgroundColor:Colors.white,
                      onPressed: (){},
                      child: Icon(Icons.check,
                          color: IsraelColors.headlinesAgenda,
                          size: 16))])
                  ]
              );
            });
          }
        },
        color: Colors.white,
    textColor: IsraelColors.mainTextColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
        side: BorderSide(
            color: Colors.blue, width: 1)),
  ), flex: 1);
}