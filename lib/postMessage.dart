// import 'dart:html';
import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flute/login.dart';
// import 'package:flute/register.dart';
import 'package:http/http.dart';
import 'package:flute/fileAccess.dart';
import 'package:flute/globals.dart' as globals;

class postMessage extends StatefulWidget {
  const postMessage({Key? key}) : super(key: key);

  @override
  State<postMessage> createState() => _postMessageState();
}

class _postMessageState extends State<postMessage> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  TextEditingController messageController = TextEditingController();

  void postAMessage(message) async {
    try {
      final url = "http://192.168.1.79:8080/message";
      final token = globals.token;
      final requestBody = json.encode({'message': '$message'});
      final requestHeaders = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };
      final response = await post(Uri.parse(url),
          headers: requestHeaders, body: requestBody);
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Beranda();
        }));
      } else if (response.statusCode == 401) {
        print('Unautorized');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login(storage: TokenStorage());
        }));
      } else {
        print('Error: ' + response.body);
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
                  "What's happening?",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(labelText: "Enter your messages"),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  width: 750.0,
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    child: Text("Post"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      postAMessage(messageController.text);
                    },
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Post",
                //         style:
                //             TextStyle(fontSize: 22, color: Color(0xFF363f93))),
                //     NeumorphicButton(
                //       margin: EdgeInsets.only(top: 12),
                //       onPressed: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return Beranda();
                //         }));
                //       },
                //       style: NeumorphicStyle(
                //           shape: NeumorphicShape.flat,
                //           boxShape: NeumorphicBoxShape.stadium()),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ));
  }

  Future<void> _showError401() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error Token'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Token expired'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            ),
          ],
        );
      },
    );
  }
}
