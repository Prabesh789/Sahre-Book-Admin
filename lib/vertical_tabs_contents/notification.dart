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
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100,
            child: Image.asset(
              'assets/chat.gif',
            ),
          ),
        ),
      ],
    );
  }
}
