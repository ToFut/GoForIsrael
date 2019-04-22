import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_for_israel/event/RegistrationEvent.dart';
import 'package:go_for_israel/page/registration_page/RegistrationBloc.dart';
import 'package:go_for_israel/page/registration_page/steps/FirstStepPage.dart';
import 'package:go_for_israel/page/registration_page/steps/ThreeStepPage.dart';
import 'package:go_for_israel/page/registration_page/steps/TwoStepPage.dart';
import 'package:go_for_israel/state/RegistrationState.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';
import 'package:image_picker/image_picker.dart';

FirstStepPage _firstStepPage;
TwoStepPage _twoStepPage;
ThreeStepPage _threeStepPage;

class RegistrationPage extends StatefulWidget {
  static bool isInvestor = true;
  String _email;
  String _password;

  @override
  RegistrationPageState createState() => RegistrationPageState(_email, _password);

  RegistrationPage(this._email, this._password);
}

class RegistrationPageState extends State<RegistrationPage> {
  RegistrationBloc bloc = RegistrationBloc();
  bool _isFirst = true;
  bool _isTwo = false;
  String _email;
  String _password;
  static bool _linkedinSwitch = false;
  static bool _wechatSwitch = false;

  RegistrationPageState(this._email, this._password);

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
    _firstStepPage = FirstStepPage(this, bloc);
    _twoStepPage  = TwoStepPage(this, bloc);
    _threeStepPage = ThreeStepPage(this, bloc, _email, _password);
    return WillPopScope(child: Scaffold(
        body: BlocBuilder<RegistrationEvent, RegistrationState>(
            bloc: bloc,
            builder: (BuildContext context, RegistrationState state) {
          return SafeArea(
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
                          GestureDetector(child: Text(Strings.DONE,style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                          )), onTap: () {

                          })
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
                                ) :
                                Container()
                              ],
                            )
                        )),
                      ],
                    ))),
                (state is RegistrationLoadingState) ? Container(child: CircularProgressIndicator(), alignment: Alignment.center, height: MediaQuery.of(context).size.height) : Container()
              ]));
        })),
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

Future<File> showTakePhotoDialog(BuildContext context) async {
  File photo;
  await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MaterialButton(
                  child: SizedBox(
                      width: double.infinity,
                      child: Text("From camera",
                          style:
                          TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.left)),
                  onPressed: () async {
                    photo = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600.0, maxHeight: 600.0);
                    Navigator.pop(context, 'success');
                  }),
              MaterialButton(
                  child: SizedBox(
                      width: double.infinity,
                      child: Text("From gallery",
                          style:
                          TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.left)),
                  onPressed: () async {
                    photo = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600.0, maxHeight: 600.0);
                    Navigator.pop(context, 'success');
                  }),
            ],
          ),
        ),
      ));
  return photo;
}
