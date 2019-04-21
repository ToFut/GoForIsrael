import 'package:flutter/material.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';

class EditFieldWidget {
  TextEditingController _contoller = TextEditingController();

  Widget getField({@required String title, @required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: IsraelColors.editFieldTextColor),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(),
            child: Theme(
                data: ThemeData(
                    cursorColor: Colors.black,
                    hintColor: Colors.grey[300],
                    primaryColor: IsraelColors.editFieldBorderColor),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: hint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: IsraelColors.editFieldFillerColor,
                    filled: true,
                  ),
                  controller: _contoller,
                )))
      ],
    );
  }

  TextEditingController get contoller => _contoller;
}
