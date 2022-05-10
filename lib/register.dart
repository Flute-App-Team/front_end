// import 'dart:html';
import 'dart:convert';
import 'package:flute/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstPasswordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();

  void tryRegister(username, firstPassword, secondPassword) async {
    try {
      if (firstPassword == secondPassword) {
        final url = "http://localhost:8080/register";
        final requestBody = json
            .encode({'username': '$username', 'password': '$firstPassword'});
        final response = await post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: requestBody);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      } else {
        // Tampilkan pesan password tidak sama
      }
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
                Text(
                  "Register your profile",
                  style: TextStyle(fontSize: 18, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                  //     return "Enter correct username";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: firstPasswordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
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
                TextFormField(
                  controller: secondPasswordController,
                  decoration: InputDecoration(labelText: "Confirm Password"),
                  obscureText: true,
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                  //     return "Please make sure your passwords match";
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
                    child: Text("Register"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      tryRegister(
                          usernameController.text,
                          firstPasswordController.text,
                          secondPasswordController.text);
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have an account already?',
                        // style: TextStyle(color: Colors.red[300]),
                      ),
                      TextSpan(
                        text: ' Login',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                          },
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Have an account already?"),
                //     GestureDetector(
                //         child: Text("Login",
                //             style: TextStyle(
                //                 fontSize: 22, color: Color(0xFF363f93))),
                //         onTap: () {
                //           Navigator.of(context).pushReplacement(
                //               MaterialPageRoute(
                //                   builder: (BuildContext context) => Login()));
                //         }),
                //   ],
                //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   // children: [
                //   //   Text("Login",
                //   //       style:
                //   //           TextStyle(fontSize: 22, color: Color(0xFF363f93))),
                //   //   NeumorphicButton(
                //   //     margin: EdgeInsets.only(top: 12),
                //   //     onPressed: () {
                //   //       Navigator.push(context,
                //   //           MaterialPageRoute(builder: (context) {
                //   //         return Login();
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

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flute/login.dart';

// class Register extends StatelessWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flute App'),
//       ),

//       body: Center(
//         child: Column(
//           children: [
//             TextFormField(
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Processing Data')),
//                   );
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),

      // body: Center(
      //   // ignore: deprecated_member_use
      //   child: RaisedButton(
      //     child: Text("Register"),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return Login();
      //       }));
      //     },
      //   ),
      // ),
//     );
//   }
// }
