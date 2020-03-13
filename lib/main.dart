import 'dart:async';
import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_detail/model/employee.dart';
import 'package:list_detail/util/my_sorting.dart';

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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: RaisedButton(
                  onPressed: () async {
                    http.Response response = await http.get(
                        "http://dummy.restapiexample.com/api/v1/employees");
                    if (response.statusCode == 200) {
                      Fimber.e(response.body);
                      setState(() {
                        var tmp = jsonDecode(response.body);
                        data = tmp['data'];
                      });
                    }
                  },
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0x767676),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Get Data',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text('Sort By '),
                  SizedBox(
                    width: 15,
                  ),
                  _getMyRaisedBtn(
                      name: 'Name',
                      bgColor: Colors.purple.value,
                      onPressHandler: () {
                        setState(() {
                          data = MySorting.sortByName(data);
                        });
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  _getMyRaisedBtn(
                      name: 'Age',
                      bgColor: Colors.red.value,
                      onPressHandler: () {
                        setState(() {
                          data = MySorting.sortByAge(data);
                        });
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  _getMyRaisedBtn(
                      name: 'Salary',
                      bgColor: Colors.blue.value,
                      onPressHandler: () {
                        setState(() {
                          data = MySorting.sortBySalary(data);
                        });
                      }),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: _createListItems(data),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _createListItems(List arrayObject) {
    if (arrayObject == null || arrayObject.length == 0) {
      return [];
    }
    return arrayObject
        .map((f) => Container(
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x7fEAEAEA),
                    blurRadius: 100.0, // has the effect of softening the shadow
                    spreadRadius: 10.0, // has the effect of extending the shadow
                    offset: Offset(
                      15.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                // borderRadius: new BorderRadius.all(...),
                // gradient: new LinearGradient(...),
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        f['employee_name'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Salary :"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(f['employee_salary']),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Age :"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(f['employee_age']),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  static Future<List> fetchEmployee(http.Client client) async {
    http.Response response =
        await client.get("http://dummy.restapiexample.com/api/v1/employees");
    if (response.statusCode == 200) {
      Map tmp = jsonDecode(response.body);
      List empList = tmp['data'].map((e) => Employee.fromJson(e)).toList();
      return empList;
    } else {
      throw Exception('Failed to load employee');
    }
  }

  RaisedButton _getMyRaisedBtn(
      {@required String name,
      @required int bgColor,
      @required onPressHandler}) {
    return RaisedButton(
      color: Color(bgColor),
      onPressed: onPressHandler,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
