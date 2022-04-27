import 'dart:html';
import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flute/register.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';

import 'package:flute/globals.dart' as globals;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void tryLogin(username, password) async {
    try {
      final url = "http://localhost:8080/login";
      final requestBody =
          json.encode({'username': '$username', 'password': '$password'});
      final response = await post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: requestBody);
      globals.token = response.body;
      print(globals.token);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Beranda();
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  "Hello!",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                Text(
                  "Welcome to Flute App",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                      return "Enter correct username";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                  //     return "Enter correct password";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(height: height * 0.05),
                Container(
                  width: 750.0,
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    child: Text("Login"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      tryLogin(
                          usernameController.text, passwordController.text);
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don' 't have an account?',
                        // style: TextStyle(color: Colors.red[300]),
                      ),
                      TextSpan(
                        text: ' Register',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }));
                          },
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //         child: Text("Don't have an account? Register",
                //             style: TextStyle(
                //                 fontSize: 22, color: Color(0xFF363f93))),
                //         onTap: () {
                //           Navigator.of(context).pushReplacement(
                //               MaterialPageRoute(
                //                   builder: (BuildContext context) =>
                //                       Register()));
                //         }),
                //     Icon(Icons.login),
                //   ],
                //   // children: [
                //   //   // Text("Login",
                //   //   //     style:
                //   //   //         TextStyle(fontSize: 22, color: Color(0xFF363f93))),
                //   //   NeumorphicButton(
                //   //     margin: EdgeInsets.only(top: 12),
                //   //     onPressed: () {
                //   //       Navigator.push(context,
                //   //           MaterialPageRoute(builder: (context) {
                //   //         return Beranda();
                //   //       }));
                //   //     },
                //   //     style: NeumorphicStyle(
                //   //         shape: NeumorphicShape.flat,
                //   //         boxShape: NeumorphicBoxShape.stadium()),
                //   //   )
                //   // ],
                // )
              ],
            ),
          ),
        ));
  }
}

// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         backgroundColor: Color(0xFFffffff),
//         body: Container(
//           padding: const EdgeInsets.only(left: 40, right: 40),
//           child: Form(
//             key: formKey, //key for form
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: height * 0.04),
//                 Text(
//                   "Hello!",
//                   style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
//                 ),
//                 Text(
//                   "Welcome to Flute App",
//                   style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
//                 ),
//                 SizedBox(height: height * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: "Username"),
//                   validator: (value) {
//                     if (value!.isEmpty ||
//                         !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
//                       return "Enter correct username";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 SizedBox(height: height * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: "Password"),
//                   // validator: (value) {
//                   //   if (value!.isEmpty ||
//                   //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
//                   //     return "Enter correct password";
//                   //   } else {
//                   //     return null;
//                   //   }
//                   // },
//                 ),
//                 SizedBox(height: height * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: "Confirm Password"),
//                   // validator: (value) {
//                   //   if (value!.isEmpty ||
//                   //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
//                   //     return "Please make sure your passwords match";
//                   //   } else {
//                   //     return null;
//                   //   }
//                   // },
//                 ),
//                 SizedBox(height: height * 0.05),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Login",
//                         style:
//                             TextStyle(fontSize: 22, color: Color(0xFF363f93))),
//                     NeumorphicButton(
//                       margin: EdgeInsets.only(top: 12),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return Login();
//                         }));
//                       },
//                       style: NeumorphicStyle(
//                           shape: NeumorphicShape.flat,
//                           boxShape: NeumorphicBoxShape.stadium()),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('Flute App'),
//     //   ),
//     //   body: Center(
//     //     // ignore: deprecated_member_use
//     //     child: RaisedButton(
//     //       child: Text("Login"),
//     //       onPressed: () {
//     //         Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //           return Beranda();
//     //         }));
//     //       },
//     //     ),
//     //   ),
//     // );
//   }
// }
