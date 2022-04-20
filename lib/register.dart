import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flute/login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flute App'),
      ),

      body: Center(
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),

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
    );
  }
}
