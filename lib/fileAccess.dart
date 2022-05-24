import 'dart:async';
import 'dart:io';
import 'package:flute/beranda.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flute/globals.dart' as globals;

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Reading and Writing Files',
//       home: FlutterDemo(storage: CounterStorage()),
//     ),
//   );
// }

class TokenStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/token.txt');
  }

  Future<String> readToken() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      print('Error reading token file');
      return "";
    }
  }

  Future<File> writeToken(String token) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(token);
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final TokenStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  String _token = "";

  @override
  void initState() {
    super.initState();
  }

  void _writeToken() {
    setState(() {
    });

    // Write the variable as a string to the file.
    //return widget.storage.writeToken("test");
    
  }

  @override
  Widget build(BuildContext context) {
    _token = globals.token;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Token: $_token',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _writeToken,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}