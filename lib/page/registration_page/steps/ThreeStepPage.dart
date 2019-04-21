import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationBloc.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';
import 'package:go_for_israel/event/RegistrationEvent.dart';

class ThreeStepPage extends StatefulWidget {
  RegistrationBloc _bloc;
  RegistrationPageState _registrationPageState;
  String _email;
  String _password;
  ThreeStepPage(this._registrationPageState, this._bloc, this._email, this._password);

  @override
  _ThreeStepPageState createState() => _ThreeStepPageState(_registrationPageState, _bloc, _email, _password);
}

class _ThreeStepPageState extends State<ThreeStepPage> {
  RegistrationBloc _bloc;
  int _choise = 0;
  EditFieldWidget stag;
  EditFieldWidget raising;
  EditFieldWidget pastInvestments;
  EditFieldWidget ticketSize;
  String _email;
  String _password;
  RegistrationPageState _registrationPageState;

  _ThreeStepPageState(this._registrationPageState, this._bloc, this._email, this._password);

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
    return Column(children: <Widget>[
      Container(
          child: RegistrationPage.isInvestor ? investorPage(): companiesPage()),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          GestureDetector(onTap: (){
            _registrationPageState.back();
          }, child: Image.asset("assets/arrow_back_active.png", height: 36, width: 57)),
          Spacer(),
          GestureDetector(onTap: (){
            if(RegistrationPage.isInvestor) {
              if(stag.contoller.text.isEmpty) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.REQUIRED_FIELDS_NOT_FILLED)));
              return;
              }
                _bloc.dispatch(RegistrationSaveUserThreeStepEvent(
                    stag.contoller.text,
                    stag.contoller.text,
                    raising.contoller.text,
                    raising.contoller.text,
                    _choise, _email, _password, context));
            } else {
              if(stag.contoller.text.isEmpty) {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.REQUIRED_FIELDS_NOT_FILLED)));
                return;
              }
              _bloc.dispatch(RegistrationSaveUserThreeStepEvent(stag.contoller.text, stag.contoller.text, raising.contoller.text, null, _choise, _email, _password, context));
            }
          }, child:Image.asset("assets/icon_finish_step.png", height: 36, width: 57)),
          Spacer()
        ],
      )
    ]);
  }
  Widget investorPage(){
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
            children: <Widget>[
              stag.getField(title: "PAST INVESTMENTS*", hint: Strings.ENTER_TEXT),
              Container(
                  padding: EdgeInsets.only(top: 20,bottom: 30),
                  child:raising.getField(title: "WHAT IS YOUR TYPICAL TICKET SIZE?", hint: Strings.ENTER_TEXT)),
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
              stag.getField(title: "STAGE*", hint: Strings.ENTER_TEXT),
                Container(
                  padding: EdgeInsets.only(top: 20,bottom: 30),
                  child:raising.getField(title: "HOW MUCH ARE YOU RAISING?", hint: Strings.ENTER_TEXT) )
            ]
        )
    );
  }
}
