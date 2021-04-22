import 'package:flutter/material.dart';

class AboutAdmin extends StatefulWidget {
  @override
  _AboutAdminState createState() => _AboutAdminState();
}

class _AboutAdminState extends State<AboutAdmin> {
  List<String> _admin = <String>[
    "1. Admin of this Share-Book Mobole Application is able to view all the users lsit.",
    "2. Admin of this Share-Book Mobile Application is able to view all the uploaded Books.",
    "3. Admin of this Share-Book Mobile Application is able to view all the Messages, Feedback, Reports etc. as Notificaiton.",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "About Admin",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
          Divider(height: 2),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _admin.length,
            itemBuilder: (context, index) {
              return Text(
                _admin[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
