import 'package:flutter/material.dart';

class AdminNotification extends StatefulWidget {
  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Center(
            child: Text("No any Notification yet."),
          ),
        ),
        Container(
          child: Image.asset('assets/chat.gif'),
        ),
      ],
    );
  }
}
