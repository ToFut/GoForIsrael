import 'package:flutter/material.dart';
import 'package:go_for_israel/page/AgendaPage.dart';
import 'package:go_for_israel/page/NavigatorPage.dart';
import 'package:go_for_israel/page/RegistrationPage.dart';
import 'package:go_for_israel/utils/Strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/image_background_login.png"), fit: BoxFit.cover)
          ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child:Column(children: <Widget>[
                Image.asset("assets/logo.png"),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 40.0, right: 40, bottom: 30, top: 30),
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(Strings.SIGN_IN,
                              style:TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700
                              )
                          ),
                          SizedBox(height: 20),
                          Theme(data: ThemeData(
                              hintColor: Colors.blue[100]),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: Strings.EMAIL,
                                      labelStyle:TextStyle(
                                          color: Colors.blue[100]) ,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[100])
                                      )
                                  )
                              )
                          ),
                          SizedBox(height: 10),
                          Theme(data: ThemeData(
                              hintColor: Colors.blue[100]),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: Strings.PASSWORD,
                                      labelStyle:TextStyle(
                                          color: Colors.blue[100]) ,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[100])
                                      )
                                  )
                              )
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                              width: 300.0,
                              height: 40.0,
                              child:RaisedButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(
                                      builder: (context) => NavigatorPage(),
                                    ));
                                  },
                                  color: Colors.blue[400],
                                  child:
                                  Text(Strings.SIGN_IN,
                                      style:TextStyle(
                                          color: Colors.white)
                                  )
                              )
                          ),
                          SizedBox(height: 5),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                           Text(Strings.OR,
                               style:TextStyle(
                                   color: Colors.blue,
                                   fontSize: 10.0,
                                   fontWeight: FontWeight.w700
                               )),
                          ]),
                          SizedBox(height: 5),
                          SizedBox(
                              width:300.0,
                              height:40.0,
                              child:RaisedButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (context) => RegistrationPage(),
                                    ));
                                    },
                                  color: Colors.blue[900],
                                  child:
                                  Text(Strings.SIGN_UP,
                                      style: TextStyle(
                                          color: Colors.white)
                                  )
                              )),
                          SizedBox(height: 10),
                          Text(Strings.REGULATION,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.blue),
                          ),
                        ],
                      ))),
                Image.asset("assets/partner_login.png", width: 350,)])
            )
        ));
  }
}
