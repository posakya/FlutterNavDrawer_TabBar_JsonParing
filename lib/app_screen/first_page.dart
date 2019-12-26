import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_app/app_screen/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();


}

class _FirstPageState extends State<FirstPage> {

  var value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample App1"),),
      body:  Material(
          color: Colors.grey[50],
          child : Center(
            child:  Card(
                margin: EdgeInsets.all(10.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                elevation: 10,
                semanticContainer: true,
                child : Wrap(
                  children : <Widget>[
                    Container(
                        width : MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10.0),
                        child : Center(
                            child : FittedBox(
                              fit: BoxFit.cover,
                              child : Text(
                                "Your luckynumber is : $value ",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            )
                        )
                    ),
                  ],
                )
            ),
          )
//         child : SingleChildScrollView(
//           child:  Row (
////             mainAxisSize: MainAxisSize.max,
//                 children : <Widget>[
//                   Card(
//
//                       margin: EdgeInsets.all(10.0),
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.white, width: 1),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       elevation: 10,
//                       semanticContainer: true,
//                       child : Wrap(
//                         children : <Widget>[
//                           Container(
//                              width : MediaQuery.of(context).size.width / 3,
//                               padding: EdgeInsets.all(10.0),
//                               child : Center(
//                                 child : Text(
//                                   "hello flutter dadadas dsada dadas dadsa dasdsad dasdasd dasdas dasdaaasd dsda das ",
//                                   textDirection: TextDirection.ltr,
//                                   style: TextStyle(
//                                       fontSize: 40.0,
//                                       fontStyle: FontStyle.italic
//                                   ),
//
//                                 ),
//                               )
//                           ),
//                         ],
//                       )
//
//
//                   ),
//
//                   Card(
//                       margin: EdgeInsets.all(10.0),
//                       color: Colors.green,
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.green, width: 1),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       elevation: 10,
//                       semanticContainer: true,
//                       child : Wrap(
//                         children : <Widget>[
//                           Container(
//                               width : MediaQuery.of(context).size.width / 3,
//                               padding: EdgeInsets.all(10.0),
//                               child : Center(
//                                 child : Text(
//                                   "yellow flutter dadadas dsada dadas dadsa dasdsad dasdasd dasdas dasdaaasd dsda das ",
//                                   textDirection: TextDirection.ltr,
//                                   style: TextStyle(
//                                       fontSize: 40.0,
//                                       fontStyle: FontStyle.italic
//                                   ),
//
//                                 ),
//                               )
//                           ),
//                         ],
//                       )
//
//
//                   ),
//
//                   Card(
//                       margin: EdgeInsets.all(10.0),
//                       color: Colors.yellow,
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.yellow, width: 1),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       elevation: 10,
//                       semanticContainer: true,
//                       child : Wrap(
//                         children : <Widget>[
//                           Container(
//                               width : MediaQuery.of(context).size.width / 3,
//                               padding: EdgeInsets.all(10.0),
//                               child : Center(
//                                 child : Text(
//                                   "Green flutter dadadas dsada dadas dadsa dasdsad dasdasd dasdas dasdaaasd dsda das ",
//                                   textDirection: TextDirection.ltr,
//                                   style: TextStyle(
//                                       fontSize: 40.0,
//                                       fontStyle: FontStyle.italic
//                                   ),
//
//                                 ),
//                               )
//                           ),
//                         ],
//                       )
//
//
//                   ),
//
//                   Card(
//                       margin: EdgeInsets.all(10.0),
//                       color: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.blue, width: 1),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       elevation: 10,
//                       semanticContainer: true,
//                       child : Wrap(
//                         children : <Widget>[
//                           Container(
//                               width : MediaQuery.of(context).size.width / 3,
//                               padding: EdgeInsets.all(10.0),
//                               child : Center(
//                                 child : Text(
//                                   "Red flutter dadadas dsada dadas dadsa dasdsad dasdasd dasdas dasdaaasd dsda das ",
//                                   textDirection: TextDirection.ltr,
//                                   style: TextStyle(
//                                       fontSize: 40.0,
//                                       fontStyle: FontStyle.italic
//                                   ),
//
//                                 ),
//                               )
//                           ),
//                         ],
//                       )
//
//
//                   ),
//
//                   Card(
//                       margin: EdgeInsets.all(10.0),
//                       color: Colors.red,
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.red, width: 1),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       elevation: 10,
//                       semanticContainer: true,
//                       child : Wrap(
//                         children : <Widget>[
//                           Container(
//                               width : MediaQuery.of(context).size.width / 3,
//                               padding: EdgeInsets.all(10.0),
//                               child : Center(
//                                 child : Text(
//                                   "Blue flutter dadadas dsada dadas dadsa dasdsad dasdasd dasdas dasdaaasd dsda das ",
//                                   textDirection: TextDirection.ltr,
//                                   style: TextStyle(
//                                       fontSize: 40.0,
//                                       fontStyle: FontStyle.italic
//                                   ),
//
//                                 ),
//                               )
//                           ),
//                         ],
//                       )
//
//
//                   )
//                 ]
//
//             ),
//
//               scrollDirection: Axis.horizontal,
//         )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          generateRandom();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(value : value.toString())),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );


  }

  int generateRandom(){
    setState(() {
      var random = Random();
      value = random.nextInt(100);
      print("Value : $value");
    });
  return value;
  }
}