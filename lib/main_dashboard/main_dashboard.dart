import 'package:admin_sharebook/cover_widget/cover_widget.dart';
import 'package:admin_sharebook/login_page/login_page.dart';
import 'package:admin_sharebook/vertical_tabs_contents/about_admin.dart';
import 'package:admin_sharebook/vertical_tabs_contents/all_books.dart';
import 'package:admin_sharebook/vertical_tabs_contents/all_users.dart';
import 'package:admin_sharebook/vertical_tabs_contents/notification.dart';
import 'package:admin_sharebook/vertical_tabs_contents/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _pageIndex = 0;
  final List<String> titles = [
    'All Users',
    'All Uploaded Books',
    'Notification',
    'About Admin',
    'Settings'
  ];

  final List icons = [
    Icons.verified_user,
    Icons.book,
    Icons.notifications,
    Icons.admin_panel_settings,
    Icons.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text(
          "Share-Book Admin Pannel",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return LoginPage();
                }));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 35),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: VerticalTabs(
                  tabBackgroundColor: Colors.white,
                  backgroundColor: Colors.grey[200],
                  tabsElevation: 10,
                  tabsShadowColor: Colors.grey[500],
                  tabsWidth: 200,
                  indicatorColor: Color(0xff333951),
                  selectedTabBackgroundColor:
                      Colors.deepPurpleAccent.withOpacity(0.1),
                  indicatorWidth: 5,
                  disabledChangePageFromContentView: true,
                  initialIndex: _pageIndex,
                  onSelect: (index) {
                    _pageIndex = index;
                  },
                  contents: <Widget>[
                    CoverWidget(widget: Allsuers()),
                    CoverWidget(widget: AllBooks()),
                    CoverWidget(widget: AdminNotification()),
                    CoverWidget(widget: AboutAdmin()),
                    CoverWidget(widget: Settings()),
                  ],
                  tabs: <Tab>[
                    tab(titles[0], icons[0]),
                    tab(titles[1], icons[1]),
                    tab(titles[2], icons[2]),
                    tab(titles[3], icons[3]),
                    tab(titles[4], icons[4]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tab(title, icon) {
  return Tab(
    child: Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: Colors.grey[800],
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[900],
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}
