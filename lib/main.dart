

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fimber/fimber.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employees',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Detail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<http.Response>(
      future: http.get("http://dummy.restapiexample.com/api/v1/employees"),
      builder: (ctx, snap){
        if(snap.connectionState == ConnectionState.done && snap.hasData){
          Map<String, dynamic> data = jsonDecode(snap.data.body);
          Fimber.e("${data['data']}");
          return Scaffold(
            appBar: AppBar(title: Text(widget.title),),
            body: Center()
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }

      },
    );
  }
}
