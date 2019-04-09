import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: IsraelColors.mainColor,
        ),
        body: Container(
            color: IsraelColors.profileBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30, left: 30),
                    child: Row(
                 children: <Widget>[
                   IconButton(
                       icon: _image == null ? Icon(Icons.account_circle) :
                       CircleAvatar(
                         backgroundImage: Image.file(_image, height:100.0,width:100.0).image, radius: 50,
                       ),
                       iconSize: 120.0,
                       color: Colors.blue[100],
                       onPressed: () {
                       }),
                       SizedBox(width: 15),
                   Container(
                     margin: EdgeInsets.only(top: 10.0),
                       child:Column(
                       children: <Widget>[
                         Text(Strings.MY_PROFILE,
                             style: TextStyle(
                                 color: IsraelColors.mainTextColor,
                                 fontSize: 22.0,
                                 fontWeight:FontWeight.w700)
                         ),
                         Row(
                           children: <Widget>[
                             Text(Strings.URL_FOR_PROFILE,
                                 style: TextStyle(
                                     color: IsraelColors.mainTextColor,
                                     fontSize: 10.0,
                                     fontWeight: FontWeight.w500)),
                             SizedBox(width: 5.0),
                             Icon(Icons.brightness_1,
                               size: 4,
                               color: IsraelColors.mainTextColor,),
                             SizedBox(width: 5.0),
                             Text(Strings.TIME_FOR_PROFILE,
                                 style: TextStyle(
                                     color: IsraelColors.mainTextColor,
                                     fontSize: 10.0,
                                     fontWeight: FontWeight.w500)),
                           ],
                         ),
                         Container(
                           margin: EdgeInsets.all(10.0),
                           height: 33.0,
                           width: 80.0,
                           decoration: BoxDecoration(
                             border: Border.all(color: IsraelColors.mainTextColor, width: 1.0),
                             borderRadius: BorderRadius.circular(5.0),
                           ),
                           child: Center(
                               child: Text(
                                   Strings.EDIT_PROFILE,
                                   style: TextStyle(fontSize: 10.0,
                                       color: IsraelColors.mainTextColor,
                                       fontWeight: FontWeight.w700)
                               )),
                         )
                       ]
                   ))


                 ],
               )
                ),
                 Container(
                   margin: EdgeInsets.all(20.0),
                   child:Column(
                   children: <Widget>[
                     getItemMenuProfile("assets/my_shendule_icon.png", Strings.MY_SCHEDULE),
                     getItemMenuProfile("assets/add_to_my_shendule.png", Strings.ADD_MY_SCHEDULE),
                     getItemMenuProfile("assets/setting_icon.png", Strings.SETTING),
                     getItemMenuProfile("assets/contact_support.png", Strings.CONTACT_SUPPORT),
                     ],
                 ),)
                
              ]
            ))
    );
  }
}

Widget getItemMenuProfile(String imagePath, String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Image.asset(imagePath),
        SizedBox(width: 10),
        Text(text,
            style: TextStyle(
                color: IsraelColors.mainTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700)
        ),
      ],
    ),
  );
}
