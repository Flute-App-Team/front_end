// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flute/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/gestures.dart';
import 'package:flute/beranda.dart';
import 'package:flute/globals.dart' as globals;

import 'beranda.dart';

class GetMessage extends StatefulWidget {
  const GetMessage({Key? key}) : super(key: key);

  @override
  State<GetMessage> createState() => _GetMessageState();
}

class _GetMessageState extends State<GetMessage> {
  var _postsJson = [];

  void fetchPosts() async {
    try {
      final url = "http://localhost:8080/message";
      final token = globals.token;
      final requestHeaders = {
        'authorization': 'Bearer $token',
      };
      final response = await get(Uri.parse(url), headers: requestHeaders);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        setState(() {
          _postsJson = jsonData;
        });
      } else if (response.statusCode == 403) {
        print('Token expired');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      } else {
        print('Error: ' + response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  int _currentIndex = 0;
  final List<Widget> _children = [];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    // var raisedButton = RaisedButton(
    //   child: Text("Register"),
    //   color: Colors.blue,
    //   textColor: Colors.white,
    //   onPressed: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return Beranda();
    //     }));
    //   },
    // );
    return MaterialApp(
      home: Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          appBar: AppBar(
            title: Text('Flute App'),
          ),
          // ignore: deprecated_member_use
          // extendBody: Center(),
          // extendBody: Center(
          //   child: ElevatedButton(child: Text(), onPressed: ),
          // ),
          // extendBody: RefreshIndicator(child: child, onRefresh: onRefresh),
          // body: Row(
          //   children: const <Widget>[
          //     ListView.builder(
          //       itemCount: _postsJson.length,
          //       itemBuilder: (context, i) {
          //         final post = _postsJson[i];
          //         final DateTime datetime =
          //             DateTime.parse(post["timestamp"]).toLocal();
          //         final dateformat =
          //             DateFormat('dd MMM yyyy | hh:mm').format(datetime);
          //         return Text(
          //             "${post["username"]}\n${post["message"]}\n${dateformat}\n");
          //       },
          //     ),
          //   ],
          // ), //   itemCount: _postsJson.length,
          body: ListView.builder(
            itemCount: _postsJson.length,
            itemBuilder: (context, i) {
              final post = _postsJson[i];
              final DateTime datetime =
                  DateTime.parse(post["timestamp"]).toLocal();
              final dateformat =
                  DateFormat('dd MMM yyyy | hh:mm').format(datetime);
              // return Text(
              //     "${post["username"]}\n${post["message"]}\n${dateformat}\n");
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "   ${post["username"]}\n",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '  ${post["message"]}\n',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    TextSpan(
                      text: '   $dateformat\n',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return Beranda();
          //     }));
          //   },
          //   child: Icon(Icons.refresh),
          // ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Beranda();
                }));
              },
              child: Icon(Icons.refresh),
            ),
          )

          // bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.account_circle),
          //       label: 'Profile',
          //     ),
          //   ],
          //   // currentIndex: _selectedIndex,
          //   // selectedItemColor: Colors.amber[800],
          //   // onTap: _onItemTapped,
          // ),
          // body: _children[_currentIndex],
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: onTappedBar,
          //   currentIndex: _currentIndex,
          //   items: [
          //     BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          //     BottomNavigationBarItem(
          //         label: 'Profile', icon: Icon(Icons.account_circle))
          //   ],
          // ),
          ),
    );
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 10));
  }
}

// Learning
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flute App'),
//         ),
//         body: Text('Body'),
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//             BottomNavigationBarItem(
//                 label: 'Setting', icon: Icon(Icons.settings))
//           ],
//         ),
//       ),
//     );
//   }
// }
