import 'dart:html';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flute/register.dart';
import 'package:flutter/gestures.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

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
                  decoration: InputDecoration(labelText: "Password"),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Beranda();
                      }));
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Dont have an account?',
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
