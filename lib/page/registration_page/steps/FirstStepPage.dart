import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_for_israel/event/RegistrationEvent.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationBloc.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';
import 'package:image_picker/image_picker.dart';

class FirstStepPage extends StatefulWidget {
  RegistrationPageState _registrationPage;
  RegistrationBloc bloc;

  @override
  _FirstStepPageState createState() => _FirstStepPageState(_registrationPage, bloc);

  FirstStepPage(this._registrationPage, this.bloc);
}

class _FirstStepPageState extends State<FirstStepPage> {
  String avatar = "";
  File file_avatar;
  int _radio = 0;
  int initValueField = 0;
  int initValueCountry = 0;
  EditFieldWidget _companyName;
  RegistrationPageState _registrationPage;
  RegistrationBloc _bloc;
  _FirstStepPageState(this._registrationPage, this._bloc);

  void initState() {
    _companyName = EditFieldWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Row(children: <Widget>[
        GestureDetector(
          child:Container(child: avatar.isEmpty
              ? Image.asset("assets/profile_photo_icon.png", width: 100, height: 100)
              : CircleAvatar(backgroundImage: Image.file(File(avatar)).image, radius: 50)),
          onTap: () {
            showTakePhotoDialog(context).then((file) {
              setState(() {
                avatar = file.path;
              });
            });
          },
        ),
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
          child: getDropDown(context, true, title: "COUNTRY*")),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Image.asset("assets/arrow_back_not_active.png", height: 36, width: 57),
          Spacer(),
          GestureDetector(onTap: (){
            if(_companyName.contoller.text.isEmpty) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.REQUIRED_FIELDS_NOT_FILLED)));
              return;
            }
            _bloc.dispatch(RegistrationSaveUserFirstStepEvent(
                _companyName.contoller.text,
                RegistrationPage.isInvestor,
                initValueField.toString(),
                initValueCountry.toString(),
                avatar));
            _registrationPage.next();
          }, child:Image.asset("assets/arrow_next_active.png", height: 36, width: 57)),
          Spacer()
        ],
      ),
    ]));
  }

  getImageCamera() async{
    Navigator.pop(context);
    var camera = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      avatar = camera.path;
    });
  }

  Future getImageGallery() async{
    Navigator.pop(context);
    var gallery = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      avatar = gallery.path;
    });
  }

  Widget getDropDown(BuildContext context, bool isCountry,
      {@required String title}) {
    List<DropdownMenuItem<int>> itemsFields = [
      DropdownMenuItem(value: 0, child: Container(child: Text("Select1 fields"), width: 150)),
      DropdownMenuItem(value: 1, child: Container(child: Text("Select2 fields"), width: 150)),
      DropdownMenuItem(value: 2, child: Container(child: Text("Select3 fields"), width: 150))
    ];
    List<DropdownMenuItem<int>> itemsCountry = [
      DropdownMenuItem(value: 0, child: Container(child: Text("Select1 country"), width: 150)),
      DropdownMenuItem(value: 1, child: Container(child: Text("Select2 country"), width: 150)),
      DropdownMenuItem(value: 2, child: Container(child: Text("Select3 country"), width: 150))
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
                        items: isCountry ? itemsCountry : itemsFields,
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