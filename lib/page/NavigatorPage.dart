import 'package:flutter/material.dart';
import 'package:go_for_israel/page/AgendaPage.dart';
import 'package:go_for_israel/page/CompaniesPage.dart';
import 'package:go_for_israel/page/ConferenceBookPage.dart';
import 'package:go_for_israel/page/MorePage.dart';
import 'package:go_for_israel/page/ProfilePage.dart';
import 'package:go_for_israel/page/SchedulePage.dart';
import 'package:go_for_israel/utils/IsraelColors.dart';
import 'package:go_for_israel/utils/Strings.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AgendaPage(),
    ConferenceBookPage(),
    SchedulePage(),
    CompaniesPage(),
    MorePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: IsraelColors.mainColor,
        leading: GestureDetector(
            child: Image.asset(
              "assets/app_bar_icon.png",
              height: 35.0,
              width: 35.0,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            }),
        title: Text(getTitle(_currentIndex), style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: Color(0xff194272),
                icon: Icon(Icons.date_range, color: Colors.grey,size: 34),
                activeIcon: Icon(Icons.date_range, color: Colors.white,size: 34),
                title: Text(Strings.AGENDA,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            BottomNavigationBarItem(
                backgroundColor: Color(0xff194272),
                icon: Icon(Icons.import_contacts, color: Colors.grey,size: 34),
                activeIcon: Icon(Icons.import_contacts, color: Colors.white,size: 34),
                title: Text(Strings.CONFERENCE_BOOK,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            BottomNavigationBarItem(
                backgroundColor: Color(0xff194272),
                icon: Icon(Icons.person, color: Colors.grey,size: 34),
                activeIcon: Icon(Icons.person, color: Colors.white,size: 34),
                title: Text(Strings.MY_SCHEDULE,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            BottomNavigationBarItem(
                backgroundColor: Color(0xff194272),
                icon: Icon(Icons.track_changes,color: Colors.grey,size: 34),
                activeIcon: Icon(Icons.track_changes, color: Colors.white,size: 34),
                title: Text(Strings.COMPANIES,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            BottomNavigationBarItem(
                backgroundColor: Color(0xff194272),
                icon: Icon(Icons.view_headline, color: Colors.grey,size: 34),
                activeIcon: Icon(Icons.view_headline, color: Colors.white,size: 34),
                title: Text(Strings.MORE,
                    style: TextStyle(fontSize: 12.0, color: Colors.white)))
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

String getTitle(int index) {
  if(index == 0) return Strings.AGENDA;
  if(index == 1) return Strings.CONFERENCE_BOOK;
  if(index == 2) return Strings.MY_SCHEDULE;
  if(index == 3) return Strings.COMPANIES;
  if(index == 4) return Strings.MORE;

  return Strings.TITLE;
}
