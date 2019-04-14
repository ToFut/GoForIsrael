import 'package:flutter/material.dart';
import 'package:go_for_israel/page/registration_page/steps/FirstStepPage.dart';
import 'package:go_for_israel/page/registration_page/steps/ThreeStepPage.dart';
import 'package:go_for_israel/page/registration_page/steps/TwoStepPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

FirstStepPage _firstStepPage = FirstStepPage();
TwoStepPage _twoStepPage = TwoStepPage();
ThreeStepPage _threeStepPage = ThreeStepPage();

class RegistrationPage extends StatefulWidget {
  static bool isInvestor = false;
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  bool _isFirst = true;
  bool _isTwo = false;

  bool _linkedinSwitch = false;
  bool _wechatSwitch = false;

  void _onChangedLinkedin(bool value){
    setState(() {
      _linkedinSwitch=value;
      });
  }
  void _onChangedWechat(bool value){
    setState(() {
      _wechatSwitch=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        body: SafeArea(
            child: Stack(children: <Widget>[
              Image.asset("assets/background_login.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height),
              Image.asset("assets/background_city.png",
              ),
              SingleChildScrollView(child: Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        GestureDetector(child: Text(Strings.CANSEL,style: TextStyle(
                          color: Colors.white12,
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        )), onTap: () {
                          Navigator.pop(context);
                        }),
                        Spacer(),
                        Text(Strings.CREAT_PROFILE,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        )),
                        Spacer(),
                        Text(Strings.DONE,style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600
                        ))
                      ]),
                       SingleChildScrollView(child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20, right: 20,top: 20),
                            color: Colors.white,
                            padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                            child: Column(
                              children: <Widget>[
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                  Expanded(child: Image.asset(_isFirst
                                      ? "assets/icon_first_step_active.png"
                                      : _isTwo
                                      ? "assets/icon_succes_step.png"
                                      : "assets/icon_succes_step.png")),
                                  Expanded(child: Container(height: 1, color:Colors.grey[200]), flex: 2),
                                  Expanded(child: Image.asset(_isFirst
                                      ? "assets/icon_two_step_not_active.png"
                                      : _isTwo
                                      ? "assets/icon_two_step_active.png"
                                      : "assets/icon_succes_step.png")),
                                  Expanded(child: Container(height: 1, color: Colors.grey[200]), flex: 2),
                                  Expanded(child: Image.asset(_isFirst
                                      ? "assets/icon_three_step_not_active.png"
                                      : _isTwo
                                      ? "assets/icon_three_step_not_active.png"
                                      : "assets/icon_three_step_active.png"))
                                ]),
                                _isFirst ? _firstStepPage : _isTwo ? _twoStepPage : _threeStepPage,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Spacer(),
                                    GestureDetector(onTap: back, child: Image.asset( _isFirst ? "assets/arrow_back_not_active.png" :
                                    _isTwo ? "assets/arrow_back_active.png" : "assets/arrow_back_active.png", height: 36, width: 57)),
                                    Spacer(),
                                    GestureDetector(onTap: next, child:Image.asset(_isFirst? "assets/arrow_next_active.png":
                                    _isTwo? "assets/arrow_next_active.png" : "assets/icon_finish_step.png", height: 36, width: 57)),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(height: 20),
                                !_isFirst && !_isTwo ?
                                Container(
                                  padding: EdgeInsets.only(top: 40),
                                    margin: EdgeInsets.only(top: 10),
                                 child:Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                       decoration: BoxDecoration(border: Border(top: BorderSide(color: IsraelColors.editFieldFillerColor,width: 2))),
                                     padding:EdgeInsets.only(bottom: 10,top: 20),
                                     child: Text("SHOW ON PROFILE",style: TextStyle(fontSize: 10, color: IsraelColors.editFieldBorderColor),)
                                   ),
                                   Container(
                                     decoration: BoxDecoration(border: Border(bottom: BorderSide(color: IsraelColors.editFieldFillerColor),top: BorderSide(color: IsraelColors.editFieldFillerColor))),
                                       child: Row(
                                           children: <Widget>[
                                             Text("LINKEDIN",style: TextStyle(fontSize: 9, color: IsraelColors.editFieldBorderColor)),
                                             Spacer(),
                                             Switch(
                                                 activeColor: IsraelColors.loginPageSignInColor,
                                                 value: _linkedinSwitch,
                                                 onChanged: (bool value){
                                                   _onChangedLinkedin(value);
                                                 })
                                           ])
                                   ),
                                   Container(
                                       decoration: BoxDecoration(border: Border(bottom: BorderSide(color: IsraelColors.editFieldFillerColor))),
                                       child: Row(
                                           children: <Widget>[
                                             Text("WECHAT",style: TextStyle(fontSize: 9, color: IsraelColors.editFieldBorderColor)),
                                             Spacer(),
                                             Switch(
                                               activeColor: IsraelColors.loginPageSignInColor,
                                                value: _wechatSwitch,
                                                 onChanged: (bool value){
                                                   _onChangedWechat(value);
                                                 })
                                           ])
                                   ),
                                 ])
                                ) : Container()
                              ],
                            )
                          ))
                    ],
                  )))
            ]))),
    onWillPop: () {
      _isFirst ? Navigator.pop(context) : back();
    });
  }
  next() {
    if(_isFirst) {
      setState(() {
        _isFirst = false;
        _isTwo = true;
      });
      return;
    }

    if(_isTwo) {
      setState(() {
        _isTwo = false;
      });
      return;
    }
  }

  back() {
    if(_isFirst) {
      return;
    }
    if(_isTwo) {
      setState(() {
        _isTwo = false;
        _isFirst = true;
        return;
      });
    }
    setState(() {
      _isTwo = true;
    });
  }

  Widget getDropDown(BuildContext context, {@required String title}) {
    int initValue = 0;
    List<DropdownMenuItem<int>> items = [
      DropdownMenuItem(value: 0,child: Text("Select1 value")),
      DropdownMenuItem(value: 1,child: Text("Select2 value")),
      DropdownMenuItem(value: 2,child: Text("Select3 value"))
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: IsraelColors.editFieldTextColor)),
          Container(
              height: 40,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: IsraelColors.editFieldFillerColor,
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DropdownButton(items: items, onChanged: (item) {
                      setState(() {
                        initValue = item;
                      });

                    }, value: initValue),
                    Spacer(),
                    Icon(Icons.expand_more)
                  ]))
        ]);
  }
}
