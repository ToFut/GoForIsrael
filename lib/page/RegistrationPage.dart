import 'package:flutter/material.dart';

bool isInvestor = true;

class RegistrationPage extends StatefulWidget{
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  DateTime selected = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
              child: Text("Cansel",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff))
              ), alignment: Alignment.center),
          backgroundColor: Color(0xff194272),
          title: Text("Creat Profile",
              style: TextStyle(
                  fontSize: 20.0)),
          centerTitle: true,
          actions: <Widget>[
            Container(child: Text("Done",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17.00,
                    fontWeight: FontWeight.w700)
            ), alignment: Alignment.center)
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      Column(
                          children: <Widget>[
                            Container(
                                width: double.infinity,
                                height: 45,
                                color: Color(0xfff1f9ff),
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 10.0),
                                child: Text("Step 1/3",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20.0,
                                        color: Color(0xff194272)
                                    )
                                )
                            ),
                            Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.account_circle),
                                      iconSize: 120.0,
                                      color: Colors.blue[100],
                                      onPressed: () {}
                                  ),
                                  Container(
                                      width: 100.0,
                                      child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                                child: Container(
                                                    child: Column(
                                                        children: <Widget>[
                                                          Image.asset("assets/linkedin_icon.png", width: 62.0, height: 62.0,),
                                                          Text("Import LinkedIn Profile",
                                                              maxLines: 2,
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Colors.blue,
                                                              fontSize: 10.0)
                                            )])))

                                          ]
                                      )),
                                  SizedBox(width: 20.0),
                                  Container(
                                      width: 100.0,
                                      child: Column(
                                          children: <Widget>[
                                           GestureDetector(
                                             child: Container(
                                                 child: Column(
                                                   children: <Widget>[
                                               Image.asset("assets/wachat_icon.png",width: 62.0, height: 62.0),
                                               Text("Import Wechat Profile",
                                                 textAlign: TextAlign.center,
                                                 maxLines: 2,
                                                 style: TextStyle(
                                                     color: Colors.blue,
                                                     fontSize: 10.0)
                                             )],)),
                                             onTap: (){},
                                           )

                                          ]
                                      ))
                                ])
                          ]
                      ),
                      Container(
                          color: Color(0xfff1f9ff),
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(color:isInvestor ?  Color(0xff2699fb) : Color(0xfff1f9ff), border: Border.all(color: Colors.blue) ),
                                            padding: EdgeInsets.all(5.0),
                                            margin: EdgeInsets.only(left: 25.0,right: 10.0,top: 2.0),
                                           child: Row(
                                            children: <Widget>[
                                              Icon(Icons.account_balance_wallet, color:isInvestor ? Colors.white : Colors.blue , size: 20),
                                              SizedBox(width: 10.0),
                                              Text("INVESTOR",style: TextStyle(fontSize: 11.0, color: isInvestor ? Colors.white : Colors.blue)),
                                              SizedBox(width: 10),
                                              isInvestor ? Container() : Container(child: Icon(
                                                  Icons.check,size: 16.0,color: Colors.blue))
                                            ],
                                          )), onTap: () {
                                            setState(() {
                                              isInvestor = !isInvestor;
                                            });
                                      }),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isInvestor = !isInvestor;
                                          });
                                        },
                                          child: Container(
                                              decoration: BoxDecoration(color:isInvestor ?  Color(0xfff1f9ff) : Color(0xff2699fb), border: Border.all(color: Colors.blue) ),
                                              padding: EdgeInsets.all(5.0),
                                            margin: EdgeInsets.only(right: 25.0,top: 2.0,left: 10.0),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset("assets/icon_ent.png",width: 20.0,height: 20.0, color: isInvestor ? Colors.blue : Colors.white),
                                              SizedBox(width: 10.0,),
                                              Text("ENTREPRENEUR", style: TextStyle(fontSize: 11.0, color: isInvestor ? Colors.blue : Colors.white)),
                                              SizedBox(width: 10.0),
                                              isInvestor ? Container(child: Icon(
                                                Icons.check, size: 16.0,color: Colors.blue, )
                                              ) : Container()
                                            ],
                                          )
                                      ))
                                    ]),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Container(child: Text("Company Name",
                                    style: TextStyle(color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 10)),
                                Theme(
                                    data: ThemeData(
                                        hintColor: Colors.blue[200]),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.indigo[100]
                                                )),
                                            helperStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.blue[500])
                                        ))),
                                SizedBox(height: 20.0),

                                Container(child: Text("Established",
                                    style: TextStyle(color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 10)),
                                Theme(
                                    data: ThemeData(
                                        hintColor: Colors.blue[200]),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.indigo[200]
                                            )),
                                        suffixIcon: Padding(
                                            padding: EdgeInsets.all(5.00),
                                            child: Icon(Icons.expand_more,
                                                color: Colors.blue)),
                                      ),

                                    )),
                              ]
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 20, top: 10),
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: Icon(
                              Icons.arrow_forward_ios, color: Colors.blue)
                      )
                    ]
                ))
        )
    );
  }

}
