import 'package:admin_sharebook/main_dashboard/main_dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1508773843436-9b40b12b1baa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 450, top: 200),
            child: Text(
              "Share-Book Application",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(125, 0, 0, 255),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 500,
              left: 650,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 4 - 20,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Text(
                    "Share-Book Admin",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigoAccent,
                          ),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigoAccent,
                          ),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 550),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainDashboard()));
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
