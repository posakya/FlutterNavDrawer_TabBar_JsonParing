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

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: true),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Book',
      theme: themeProvider.getThemeData,
      home: SampleAppPage(),
    );
  }
}

