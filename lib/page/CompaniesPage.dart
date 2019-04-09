import 'package:flutter/material.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class CompaniesPage extends StatefulWidget{
  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:
    ListView.builder(itemBuilder: (context,index) => getCompaniesListBuilder()));
  }
}

Widget getCompaniesListBuilder(){
  return Container(
    decoration: BoxDecoration(color: IsraelColors.lineAgenda),
      child:Column(
    children: <Widget>[
      Card(
        color: Colors.white,
          margin: EdgeInsets.only(left: 30,right: 30,top: 30),
          child:Container(
            padding: EdgeInsets.all(10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  Image.asset("assets/companies_logo.png"),
                  Spacer(),
                  Row(children: <Widget>[
                    Image.asset("assets/facebook_icon.png"),
                    SizedBox(width: 7),
                    Image.asset("assets/twitter_icon.png"),
                    SizedBox(width: 7),
                    Image.asset("assets/web_icon.png")]
                  )]
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: IsraelColors.lineAgenda))),
                    child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Dune Medical Devices",
                        style: TextStyle(
                            color: IsraelColors.mainTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),),
                      SizedBox(height: 5),
                      Text(Strings.TEXT_FOR_COMPANIES,
                        style: TextStyle(
                            color: IsraelColors.companiesTextColor,
                            fontSize: 12),)]
                )),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Column(children: <Widget>[
                    Text("Company Representative",style: TextStyle(color: Colors.blue, fontSize: 12),),
                    Text("Lori Chmura - CEO",
                        style: TextStyle(
                            color: IsraelColors.companiesCEOname,
                            fontSize: 16,fontWeight: FontWeight.w700))]
                  ),
                  Spacer(),
                  Row(children: <Widget>[
                    Icon(Icons.mail_outline,color: Colors.lightBlue,size: 20),
                    SizedBox(width: 18),
                    Icon(Icons.phone,color: Colors.lightBlue,size: 20,),
                    SizedBox(width: 18),
                    Icon(Icons.message,color: Colors.lightBlue,size: 20,)])
                ])]))
          )]));
}