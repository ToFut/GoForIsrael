import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';

class FirstStepPage extends StatefulWidget {
  @override
  _FirstStepPageState createState() => _FirstStepPageState();
}

class _FirstStepPageState extends State<FirstStepPage> {
  int _radio = 0;
  int initValueField = 0;
  int initValueCountry = 0;
  EditFieldWidget _companyName;

  void initState() {
    _companyName = EditFieldWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Row(children: <Widget>[
        Image.asset("assets/profile_photo_icon.png", width: 100, height: 100),
        SizedBox(width: 5),
        Column(children: <Widget>[
          Text("Import Profile From",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: IsraelColors.editFieldBorderColor)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            IconButton(
                iconSize: 50,
                icon: Image.asset("assets/linkedin_icon.png"),
                onPressed: () {}),
            IconButton(
                iconSize: 50,
                icon: Image.asset("assets/wachat_icon.png"),
                onPressed: () {})
          ])
        ])
      ]),
      Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Radio(
                      activeColor: IsraelColors.loginPageSignInColor,
                      value: 0,
                      groupValue: _radio,
                      onChanged: (int value) {
                        setState(() {
                          RegistrationPage.isInvestor = value == 0 ? true : false;
                          _radio = value;
                        });
                      }),
                  Text("Investor",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ]),
                Spacer(),
                Row(children: <Widget>[
                  Radio(
                      activeColor: IsraelColors.loginPageSignInColor,
                      value: 1,
                      groupValue: _radio,
                      onChanged: (int value) {
                        setState(() {
                          RegistrationPage.isInvestor = value == 0 ? true : false;
                          _radio = value;
                        });
                      }),
                  Text("Israel Company",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ])
              ])),
      Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child:
              _companyName.getField(title: "COMPANY NAME *", hint: "Company")),
      Container(
          padding: EdgeInsets.only(bottom: 20),
          child: getDropDown(context, false, title: "FIELD*")),
      Container(
          padding: EdgeInsets.only(bottom: 20),
          child: getDropDown(context, true, title: "COUNTRY*"))
    ]));
  }

  Widget getDropDown(BuildContext context, bool isCountry,
      {@required String title}) {
    List<DropdownMenuItem<int>> items = [
      DropdownMenuItem(value: 0, child: Container(child: Text("Select1 value"), width: 150)),
      DropdownMenuItem(value: 1, child: Container(child: Text("Select2 value"), width: 150)),
      DropdownMenuItem(value: 2, child: Container(child: Text("Select3 value"), width: 150))
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
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: IsraelColors.editFieldFillerColor,
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(10)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: Container(child: DropdownButton(
                        hint: Text("Select"),
                        iconSize: 0,
                        value: isCountry ? initValueCountry : initValueField,
                        items: items,
                        onChanged: (item) {
                          setState(() {
                            isCountry
                                ? initValueCountry = item
                                : initValueField = item;
                          });
                        })))),
          ]))
    ]);
  }
}
