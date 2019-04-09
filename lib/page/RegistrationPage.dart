import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_for_israel/page/NavigatorPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:go_for_israel/utils/Strings.dart';

bool isInvestor = true;

class RegistrationPage extends StatefulWidget {


  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

enum Choise{Gallery, Camera}

class _RegistrationPageState extends State<RegistrationPage> {
 var _established =["Established 1", "Established 2","Established 3"];
 var _establishedChoise = "Established 1";


  DateTime _date = DateTime.now();


  Future<Null>_someTime(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2029)
    );
    if(picked != null ){
      setState(() {
        _date=picked;
      });
    }
  }

  String photoChoise='';
 void photoChoise1 (String value){
   setState(() {
     photoChoise=value;
   });
 }
 Future<Null> askPhoto()async{
   switch(
   await showDialog(
       context: context, 
       child: Container(
         margin: EdgeInsets.all(20.0),
         child:Column(
           mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           SizedBox(height: 70, 
             child: RaisedButton(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)
               ),
               color:Colors.blue[500],
               onPressed: (){getImage(true);},
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.add_a_photo,
                         size: 30.0,
                         color: Colors.blue[900]),
                     SizedBox(width: 30.0),
                     Text(Strings.PHOTO_AT_CAMERA,
                         style: TextStyle(
                             fontWeight: FontWeight.w700,
                             fontSize: 20.0,
                             color:Colors.blue[900]
                         ))
                   ]))),
           SizedBox(height: 10),
           SizedBox(height: 70,
             child:RaisedButton(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)
               ),
               color:Colors.blue[900],
               onPressed: (){getImage(false);},
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.add_photo_alternate,
                         size: 30.0,
                         color: Colors.blue[500]),
                     SizedBox(width: 30.0),
                     Text(Strings.PHOTO_AT_GALLERY,
                         style: TextStyle(
                             fontWeight: FontWeight.w700,
                             fontSize: 20.0,
                             color: Colors.blue[500])
                     )]
               )
             ))

   ]),))
   ){
     case Choise.Gallery:
       photoChoise1(Strings.GALLERY);
       break;
     case Choise.Camera:
       photoChoise1(Strings.CAMERA);
       break;
   }
 }
  DateTime selected = DateTime.now();
  File _image;

  Future getImage(bool profilePhoto)async{
    File image;
    if(profilePhoto){
      image= await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              child: Container(
            margin: EdgeInsets.only(left: 5),
              child: Text(Strings.CANSEL,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff))),
              alignment: Alignment.center),
            onTap: () {
             Navigator.pop(context);
            }
          ),
          backgroundColor: Color(0xff194272),
          title: Text(Strings.CREAT_PROFILE, style: TextStyle(fontSize: 18.0)),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(child: Container(
              margin: EdgeInsets.only(right: 10),
                child: Text(Strings.DONE,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.00, fontWeight: FontWeight.w700)),
                alignment: Alignment.center)
            , onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NavigatorPage()));
              })
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Column(children: <Widget>[
            Container(
                width: double.infinity,
                height: 45,
                color: Color(0xfff1f9ff),
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text(Strings.STEP,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Color(0xff194272)))),
            Row(children: <Widget>[
              IconButton(
                  icon: _image == null ? Icon(Icons.account_circle) :
                  CircleAvatar(
                      backgroundImage: Image.file(_image, height:100.0,width:100.0).image, radius: 50,
                  ),
                  iconSize: 120.0,
                  color: Colors.blue[100],
                  onPressed: () {
                    askPhoto();
                    }),
              Container(
                  width: 100.0,
                  child: Column(children: <Widget>[
                    GestureDetector(
                        child: Container(
                            child: Column(children: <Widget>[
                          Image.asset(
                            "assets/linkedin_icon.png",
                            width: 62.0,
                            height: 62.0,
                          ),
                          Text(Strings.IMPORT_LINKEDIN,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10.0))
                        ])),
                        onTap: () {
                          //_getProfile();
                        })
                  ])),
              SizedBox(width: 20.0),
              Container(
                  width: 90.0,
                  child: Column(children: <Widget>[
                    GestureDetector(
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Image.asset("assets/wachat_icon.png",
                              width: 62.0, height: 62.0),
                          Text(Strings.IMPORT_WECHAT,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10.0))
                        ],
                      )),
                      onTap: () {},
                    )
                  ]))
            ])
          ]),
          Container(
              color: Color(0xfff1f9ff),
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      GestureDetector(
                          child: Container(
                               decoration: BoxDecoration(
                                  color: !isInvestor
                                      ? Color(0xff2699fb)
                                      : Color(0xfff1f9ff),
                                  border: Border.all(color: IsraelColors.lineAgenda)),
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(right: 10.0, top: 2.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.account_balance_wallet,
                                      color: !isInvestor
                                          ? Colors.white
                                          : Colors.blue,
                                      size: 20),
                                  SizedBox(width: 20.0),
                                  Text(Strings.INVESTOR,
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          color: !isInvestor
                                              ? Colors.white
                                              : Colors.blue)),
                                  SizedBox(width: 20),
                                  !isInvestor
                                      ? Container()
                                      : Container(
                                          child: Icon(Icons.check,
                                              size: 16.0, color: Colors.blue))
                                ],
                              )),
                          onTap: () {
                            setState(() {
                              if(!isInvestor) isInvestor = !isInvestor;
                            });
                          }),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isInvestor) isInvestor = !isInvestor;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: !isInvestor
                                      ? Color(0xfff1f9ff)
                                      : Color(0xff2699fb),
                                  border: Border.all(color: IsraelColors.lineAgenda)),
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Image.asset("assets/icon_ent.png",
                                      width: 20.0,
                                      height: 20.0,
                                      color: !isInvestor
                                          ? Colors.blue
                                          : Colors.white),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(Strings.ENTREPRENEUR,
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          color: !isInvestor
                                              ? Colors.blue
                                              : Colors.white)),
                                  SizedBox(width: 20.0),
                                  !isInvestor
                                      ? Container(
                                          child: Icon(
                                          Icons.check,
                                          size: 16.0,
                                          color: Colors.blue,
                                        ))
                                      : Container()
                                ],
                              )))
                    ]),


                SizedBox(height: 20.0),
                Container(
                    child: Text(Strings.COMPANY_NAME,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 10)),
                Theme(
                    data: ThemeData(hintColor: Colors.blue[200]),
                    child: TextFormField(
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.indigo[100])),
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue[500])))),
                          Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                            Container(
                              child: Text("Established",
                                  style: TextStyle(
                                      color: Colors.blue, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 5,top: 10)),
                            Container(
                              decoration:BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all(
                                      color:IsraelColors.lineAgenda)),
                              child:FlatButton(
                                  color: Colors.white,
                                  child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(' 17/07/2017',
                                            style: TextStyle(
                                                color: IsraelColors.headlinesAgenda,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16)),
                                        SizedBox(width: 25),
                                        Icon(Icons.expand_more,color: Colors.blue,)
                                      ]),
                                  onPressed:() =>_someTime(context)))],),
                          SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Container(
                                child: Text("Established",
                                  style: TextStyle(
                                      color: Colors.blue, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.start),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 5,top: 10)),
                          Container(
                              decoration:BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all(
                                      color:IsraelColors.lineAgenda)),
                              child:FlatButton(
                                  child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(' 23/07/2017',
                                            style: TextStyle(
                                                color: IsraelColors.headlinesAgenda,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16)),
                                        SizedBox(width: 25),
                                        Icon(Icons.expand_more,color: Colors.blue,)
                                      ]) ,
                                  onPressed:() =>_someTime(context)) )])

                          ]),
                    SizedBox(height: 20.0),
                    Container(
                        child: Text("Established",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start),
                        alignment: Alignment.centerLeft,
                       ),
                Container(
                 padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blue[200])),
                     child:Row(
                       mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Spacer(),
                          DropdownButton<String>(
                             items: _established.map(
                                     (String dropDownStringItem){
                                   return DropdownMenuItem<String>(
                                       child: Text(dropDownStringItem),
                                       value: dropDownStringItem);
                                 }
                             ).toList(), onChanged: (String somethingValueSelected){setState(() {
                             this._establishedChoise = somethingValueSelected;
                           });},
                             iconSize: 1,
                           ),
                           Spacer(),
                           Icon(Icons.expand_more,color: Colors.blue,)])
                     ),
              ])),
          Container(
              margin: EdgeInsets.only(right: 20, top: 10),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios, color: Colors.blue))
        ]))));
  }
}

//_getProfile() async {
//  String status = await FlutterLinkedinLogin.loginBasic();
//  print(status.toString());
//  LinkedInAccessToken accessToken = await FlutterLinkedinLogin.accessToken();
//  print(accessToken.toString());
//  LinkedInProfile profile = await FlutterLinkedinLogin.getProfile();
//  print(profile.toString());
//}
