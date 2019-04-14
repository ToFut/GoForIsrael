import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _check = false;
  EditFieldWidget email;
  EditFieldWidget password;

  @override
  void initState() {
    email = EditFieldWidget();
    password = EditFieldWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: <Widget>[
                  Image.asset("assets/background_login.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height),
                  Stack(children: <Widget>[
                    Image.asset("assets/background_city.png",
                       )
                  ,
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                top: 30, left: 30, right: 30, bottom: 5),
                            alignment: Alignment.center,
                            height: 500,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(Strings.SIGN_IN,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 21)),
                                  Spacer(),
                                  email.getField(
                                      title: Strings.YOUR_E_MAIL,
                                      hint: Strings.ENTER_YOUR_E_MAIL),
                                  Spacer(),
                                  password.getField(
                                      title: Strings.PASSWORD_CAPS_LOCK,
                                      hint: Strings.ENTER_YOUR_PASSWORD),
                                  Container(
                                    margin: EdgeInsets.only(top: 1),
                                      child:Row(children: <Widget>[
                                        Row(children: <Widget>[
                                          Checkbox(
                                          activeColor:
                                          IsraelColors.loginPageSignInColor,
                                          value: _check,
                                          onChanged: (bool resp) {
                                            setState(() {
                                              _check = resp;
                                            });
                                          }),
                                      Text(Strings.STAY_SIGNED_IN,
                                          style: TextStyle(
                                              color: IsraelColors
                                                  .editFieldBorderColor,
                                              fontSize: 9))
                                    ]),
                                    Spacer(),
                                    FlatButton(
                                        onPressed: () {},
                                        child: Text(Strings.FORGOT_YOUR_PASSWORD,
                                            style: TextStyle(
                                                color: IsraelColors
                                                    .loginPageSignInColor,
                                                fontSize: 10)))
                                  ]) )
                                  ,
                                  Spacer(),
                                  FlatButton(
                                      onPressed: () {},
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: IsraelColors
                                                  .loginPageSignInColor,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text(Strings.SIGN_IN,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          width: 70,
                                          height: 2,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.grey[200])))),
                                        Container(child: Text(Strings.OR), margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5)),
                                        Container(
                                            alignment: Alignment.center,
                                          width: 70,
                                          height: 2,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[200]))))
                                      ]),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: IsraelColors
                                                  .editFieldBorderColor,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text(Strings.SIGN_UP,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey[200])))),
                                  Container(
                                      width: 200,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      child: Text(Strings.REGULATION,
                                          style: TextStyle(
                                              color: IsraelColors
                                                  .editFieldBorderColor,
                                              fontSize: 9)))
                                ]))
                      ])])]))));
  }
}