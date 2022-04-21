import 'package:flute/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirm Password"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Login",
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF363f93))),
                    NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.stadium()),
                    )
                  ],
                )
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
