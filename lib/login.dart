import 'dart:html';

import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flute/register.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flute App'),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Beranda();
            }));
          },
        ),
      ),
    );
  }
}
