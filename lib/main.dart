import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './app_screen/ezvzjson.dart';
import 'package:search_widget/search_widget.dart';
import './residemenu.dart';
import 'package:provider/provider.dart';
import './model_provider/theme_provider.dart';
import 'app_screen/homepage.dart';
import './pages/theme_changer_page.dart';

//void main() {
//  runApp(
//    ChangeNotifierProvider(
//      create: (_)  => ThemeProvider(isLightTheme: true),
//      child: MyApp(),
//    ),
//  );
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final themeProvider = Provider.of<ThemeProvider>(context);
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Theme Changer',
//      theme: themeProvider.getThemeData,
//      home: ThemeChangerPage(),
//    );
//  }
//}

void main() {
//  runApp(SampleApp());

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: true),
      child: MyApp(),
    ),
  );

//  ChangeNotifierProvider(
//    builder: (_) => ThemeProvider(isLightTheme: true),
////    child: MyApp(),
//  ),
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: themeProvider.getThemeData,
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: SampleAppPage(),
    );
  }
}




//import 'package:flutter/material.dart';

//void main() => runApp(
//    new MaterialApp(
//      home: new Home(),
//    )
//);
//
//class Home extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => new HomeState();
//}
//class HomeState extends State<Home> {
//  List<String> items = new List(5);
//  TextEditingController controller = new TextEditingController();
//  String filter;
//
//  @override
//  initState() {
//    super.initState();
//    items[0] = "Apple";
//    items[1] = "Banana";
//    items[2] = "Mango";
//    items[3] = "Milk";
//    items[4] = "Water";
//
//    controller.addListener(() {
//      setState(() {
//        filter = controller.text;
//      });
//    });
//  }
//    @override
//    void dispose() {
//      controller.dispose();
//      super.dispose();
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      return new Material(
//        child: new Column(
//            children: <Widget>[
//        new Padding(
//        padding: new EdgeInsets.only(top: 20.0),
//      ),
//      new TextField(
//      decoration: new InputDecoration(
//      labelText: "Search something"
//      ),
//      controller: controller,
//      ),
//      new Expanded(
//      child: new ListView.builder(
//        itemCount: items.length,
//        itemBuilder: (BuildContext context, int index) {
//          return filter == null || filter == "" ? new Card(child: new Text(items[index])) : items[index].contains(filter) ? new Card(child: new Text(items[index])) : new Container();
//        },
//      ),
//      ),
//      ],
//      ),
//      );
//    }
//
//}
