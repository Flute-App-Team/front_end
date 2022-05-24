// import 'dart:html';
import 'package:flute/login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
// import 'package:flute/register.dart';
import 'package:flute/globals.dart' as globals;
import 'package:flute/fileAccess.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text("Logout"),
          // color: Color(0xffFF0000),
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {
            globals.token = "";
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Login(storage: TokenStorage());
            }));
          },
        ),
      ),
    );
  }
}
