import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final String value;

  const SecondPage({Key key, this.value}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title : Text("Second Page ${widget.value}"),),
        body: Material(
          color: Colors.grey[50],
          child: Center(
            child: Container(
              child: Text(
                " I am here : ${widget.value}"
              ),
            ),
          ),
        ),
    );
  }
}

/*
//import 'package:flutter/material.dart';
//import './app_screen/first_page.dart';
//
//
//void main() =>  runApp(new MyFlutter());
//
//class MyFlutter extends StatelessWidget {
//
//  var first = FirstPage();
//
//  @override
//  Widget build(BuildContext context) {
//    return
//        MaterialApp(
//            debugShowCheckedModeBanner: false,
//            title: "Sample App",
//            home: FirstPage()
//        );
//  }
//}

 */
