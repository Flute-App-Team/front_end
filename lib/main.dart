import 'dart:convert';

import 'package:flute/beranda.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Beranda(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final url = "https://jsonplaceholder.typicode.com/posts";

//   var _postsJson = [];

//   void fetchPosts() async {
//     try {
//       final response = await get(Uri.parse(url));
//       final jsonData = jsonDecode(response.body) as List;

//       setState(() {
//         _postsJson = jsonData;
//       });
//     } catch (e) {}
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flute App'),
//         ),
//         body: ListView.builder(
//             itemCount: _postsJson.length,
//             itemBuilder: (context, i) {
//               final post = _postsJson[i];
//               return Text(
//                   "Title : ${post["title"]}\n Body : ${post["body"]}\n\n ");
//             }),
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
