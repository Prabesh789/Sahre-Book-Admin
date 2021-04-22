import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset("assets/admin.png"),
            RaisedButton(
              onPressed: () {},
              child: Text("Request To Change Email"),
              color: Colors.teal[300],
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Request To Change Password"),
              color: Colors.teal[300],
            )
          ],
        ),
      ),
    );
  }
}
