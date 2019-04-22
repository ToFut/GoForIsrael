import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/page/registration_page/RegistrationBloc.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';
import 'package:go_for_israel/event/RegistrationEvent.dart';
import 'dart:io';

class TwoStepPage extends StatefulWidget {
  RegistrationBloc _bloc;
  RegistrationPageState _registrationPage;

  TwoStepPage(this._registrationPage, this._bloc);

  @override
  _TwoStepPageState createState() => _TwoStepPageState(_registrationPage, _bloc);
}

class _TwoStepPageState extends State<TwoStepPage> {
  File photo;
  File logo;
  File pager;
  RegistrationBloc _bloc;
  RegistrationPageState _registrationPage;
  EditFieldWidget companyDescription;
  EditFieldWidget title;
  EditFieldWidget companyRepresentative;
  EditFieldWidget website;
  EditFieldWidget mobileWechat;
  EditFieldWidget numberOfEmployees;
  int initValue;
  int initValueDropDown = 0;

  _TwoStepPageState(this._registrationPage, this._bloc);

  @override
  void initState() {
    companyRepresentative = EditFieldWidget();
    title = EditFieldWidget();
    companyDescription = EditFieldWidget();
    website = EditFieldWidget();
    mobileWechat = EditFieldWidget();
    numberOfEmployees = EditFieldWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.only(top: 20,bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            companyRepresentative.getField(title: Strings.COMPANY_REPRESENTATIVE, hint: Strings.ENTER_TEXT),
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child:title.getField(title: Strings.TITLE_CAPSLOCK, hint: Strings.ENTER_TEXT)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Column(children: <Widget>[
                IconButton(
                    iconSize: 40,
                    icon: Image.asset(photo == null ? "assets/icon_add_photo_on_two_step.png" : "assets/icon_finish_step.png"),
                    onPressed:(){
                      showTakePhotoDialog(context).then((file) {
                        setState(() {
                          photo = file;
                        });
                      });
                    }),
                Text("Add photo",style: TextStyle(fontSize: 12))
              ]),
              Spacer(),
              Column(children: <Widget>[
                IconButton(
                  iconSize: 40,
                  icon: Image.asset(logo == null ? "assets/icon_add_photo_on_two_step.png" : "assets/icon_finish_step.png"),
                    onPressed:(){
                      showTakePhotoDialog(context).then((file) {
                        setState(() {
                          logo = file;
                        });
                      });
                    }),
                Text("Add company logo",style: TextStyle(fontSize: 12))
              ]),
              Spacer(),
              Column(children: <Widget>[
                IconButton(
                    iconSize: 40,
                    icon: Image.asset(pager == null ? "assets/icon_add_photo_on_two_step.png" : "assets/icon_finish_step.png"),
                    onPressed:() async{
                      pager = await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
                    }),
                Text("Add one pager",style: TextStyle(fontSize: 12))
              ])
            ]),
            Container(
              padding: EdgeInsets.only(top: 10),
                child:companyDescription.getField(title: Strings.COMPANY_DESCRIPTION, hint: Strings.ENTER_TEXT)),
            Container(
                padding: EdgeInsets.only(top: 10),
                child:website.getField(title: Strings.WEBSITE, hint: Strings.ENTER_TEXT)),
            Container(
                padding: EdgeInsets.only(top: 10),
                child:getDropDown(context, title: "NUMBER OF EMPLOYEES*")),
            Container(
                padding: EdgeInsets.only(top: 10),
                child:mobileWechat.getField(title: Strings.MOBILE_WECHAT, hint: Strings.ENTER_TEXT)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                GestureDetector(onTap: (){
                  _registrationPage.back();
                }, child: Image.asset("assets/arrow_back_active.png", height: 36, width: 57)),
                Spacer(),
                GestureDetector(onTap: (){
                  if(companyRepresentative.contoller.text.isNotEmpty){
                    _bloc.dispatch(RegistrationSaveUserTwoStepEvent(
                        companyRepresentative.contoller.text,
                        title.contoller.text,
                        companyDescription.contoller.text,
                        website.contoller.text,
                        initValueDropDown,
                        mobileWechat.contoller.text,
                        photo?.path,
                        logo?.path,
                        pager?.path,
                    ));
                    _registrationPage.next();
                    return;
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.REQUIRED_FIELDS_NOT_FILLED)));
                  }
                }, child:Image.asset("assets/arrow_next_active.png", height: 36, width: 57)),
                Spacer()
              ],
            )
          ],
        )

    ) );
  }

  Widget getDropDown(BuildContext context, {@required String title}) {
    List<DropdownMenuItem<int>> numberOfEmployers = [
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
                            value: initValueDropDown,
                            items: numberOfEmployers,
                            onChanged: (item) {
                              setState(() {
                                initValueDropDown = item;
                              });
                            })))),
              ]))
        ]);
  }
}
