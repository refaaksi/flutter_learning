import 'package:flutter/material.dart';
import './home.dart';
import './login.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      initialRoute: MyHomePage.routeName ,
      routes: {
        MyHomePage.routeName : (context) => MyHomePage(),
        MyLoginPage.routeName : (context) => MyLoginPage()
      },
    );
  }
}