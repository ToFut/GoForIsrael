import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class ThreeStepPage extends StatefulWidget {
  @override
  _ThreeStepPageState createState() => _ThreeStepPageState();
}

class _ThreeStepPageState extends State<ThreeStepPage> {
  int _choise = 0;
  EditFieldWidget stag;
  EditFieldWidget raising;

  Widget getDropDown(BuildContext context, {@required String title}) {
    int initValue ;
    List<DropdownMenuItem<int>> items = [
      DropdownMenuItem(value: 1,child: Text("Select1 value")),
      DropdownMenuItem(value: 2,child: Text("Select2 value")),
      DropdownMenuItem(value: 3,child: Text("Select3 value"))
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
                    DropdownButton(iconSize:0,items: items, onChanged: (int item) {
                      setState(() {
                        initValue = item;
                      });
                    }, value: initValue),
                    Spacer(),
                    Icon(Icons.expand_more)
                  ]))
        ]);
  }

  @override
  void initState() {
    stag = EditFieldWidget();
    raising = EditFieldWidget();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: RegistrationPage.isInvestor ? investorPage(): companiesPage()
    );

  }
  Widget investorPage(){
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
            children: <Widget>[
              stag.getField(title: "PAST INVESTMENTS*", hint: Strings.ENTER_TEXT),
              Container(
                  padding: EdgeInsets.only(top: 20,bottom: 30),
                  child:raising.getField(title: "HOW MUCH ARE YOU RAISING?", hint: Strings.ENTER_TEXT)),
               Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("ARE YOU ABLE TO INVEST IN USD?"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Radio(
                                    activeColor: IsraelColors.loginPageSignInColor,
                                    value: 0,
                                    groupValue: _choise,
                                    onChanged: (int value) {
                                      setState(() {
                                        _choise = value;
                                      });
                                    }),
                                Text("NO",
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              ]),
                              Row(children: <Widget>[
                                Radio(
                                    activeColor: IsraelColors.loginPageSignInColor,
                                    value: 1,
                                    groupValue: _choise,
                                    onChanged: (int value) {
                                      setState(() {
                                        _choise = value;
                                      });
                                    }),
                                Text("YES",
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              ])
                            ])
                      ])
              )

            ]
        )
    );
  }
  Widget companiesPage(){
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
            children: <Widget>[
              stag.getField(title: "PAST INVESTMENTS*", hint: Strings.ENTER_TEXT),
                Container(
                  padding: EdgeInsets.only(top: 20,bottom: 30),
                  child:raising.getField(title: "WHAT IS YOUR TYPICAL TICKET SIZE?", hint: Strings.ENTER_TEXT) )
            ]
        )
    );
  }
}
