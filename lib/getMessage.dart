import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flute/globals.dart' as globals;

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
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flute App'),
        ),
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            final DateTime datetime = DateTime.parse(post["timestamp"]).toLocal();
            final dateformat = DateFormat('dd MMM yyyy | hh:mm').format(datetime);
            return Text(
                "${post["username"]}\n${post["message"]}\n${dateformat}\n");
          },
        ),
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
