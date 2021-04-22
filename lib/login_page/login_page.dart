import 'package:admin_sharebook/admin_bloc/admin_bloc.dart';
import 'package:admin_sharebook/main_dashboard/main_dashboard.dart';
import 'package:admin_sharebook/model/admin_model.dart';
import 'package:admin_sharebook/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: "admin123@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "admin123");
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      cubit: inject<AdminBloc>(),
      listener: (context, state) {
        if (state is AdminAuthenticatedState) {
          Fluttertoast.showToast(
            webPosition: "center",
            gravity: ToastGravity.BOTTOM_RIGHT,
            msg: "Admin loggedIn Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          emailController.clear();
          passwordController.clear();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MainDashboard(),
            ),
          );
        }
        if (state is AdminErrorState) {
          Fluttertoast.showToast(
            webPosition: "center",
            gravity: ToastGravity.BOTTOM_RIGHT,
            msg: "Email or Password is Worng..!",
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formkey,
          child: Scaffold(
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
                    height: MediaQuery.of(context).size.height / 3 - 50,
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
                            controller: emailController,
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'User Email Can not be empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
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
                            validator: (value) {
                              if (value.length < 4) {
                                return "Legnth must be min 6 character";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 550),
                            TextButton(
                              onPressed: () {
                                if (!_formkey.currentState.validate()) {
                                  Fluttertoast.showToast(
                                    webPosition: Center(),
                                    msg: "Invalid details",
                                    backgroundColor: Colors.white,
                                    textColor: Colors.red,
                                  );
                                } else {
                                  inject<AdminBloc>().add(LoginEvent(
                                      adminModel: AdminModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  )));
                                }
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
          ),
        );
      },
    );
  }
}
