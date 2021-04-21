import 'package:admin_sharebook/login_page/login_page.dart';
import 'package:admin_sharebook/utils/init.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInit.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
