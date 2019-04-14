import 'package:flutter/material.dart';
import 'package:go_for_israel/page/login_page/widgets/EditFieldWidget.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class TwoStepPage extends StatefulWidget {
  @override
  _TwoStepPageState createState() => _TwoStepPageState();
}

class _TwoStepPageState extends State<TwoStepPage> {
  EditFieldWidget companyDescription;
  EditFieldWidget title;
  EditFieldWidget companyRepresentative;
  EditFieldWidget website;
  EditFieldWidget mobileWechat;
  EditFieldWidget numderOfEmployees;
  int initValue;
  int initValueDropDown = 0;

  @override
  void initState() {
    companyRepresentative = EditFieldWidget();
    title = EditFieldWidget();
    companyDescription = EditFieldWidget();
    website = EditFieldWidget();
    mobileWechat = EditFieldWidget();
    numderOfEmployees = EditFieldWidget();
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
                    icon: Image.asset("assets/icon_add_photo_on_two_step.png"),
                    onPressed:(){}),
                Text("Add photo",style: TextStyle(fontSize: 12))
              ]),
              Spacer(),
              Column(children: <Widget>[
                IconButton(
                  iconSize: 40,
                    icon: Image.asset("assets/icon_add_photo_on_two_step.png"),
                    onPressed:(){}),
                Text("Add company logo",style: TextStyle(fontSize: 12),)
              ]),
              Spacer(),
              Column(children: <Widget>[
                IconButton(
                    iconSize: 40,
                    icon: Image.asset("assets/icon_add_photo_on_two_step.png"),
                    onPressed:(){}),
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
                child:mobileWechat.getField(title: Strings.MOBILE_WECHAT, hint: Strings.ENTER_TEXT)),





          ],
        )

    ) );
  }

  Widget getDropDown(BuildContext context, {@required String title}) {
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
                            value: initValueDropDown,
                            items: items,
                            onChanged: (item) {
                              setState(() {
                                initValueDropDown = item;
                              });
                            })))),
              ]))
        ]);
  }
}
