import 'package:flutter/material.dart';

class AdminNotification extends StatefulWidget {
  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Center(
                child: Image.asset(
                  'assets/chat.gif',
                ),
              ),
            ),
            Text("No any Notification yet."),
          ],
        ),
      ),
    );
  }
}
