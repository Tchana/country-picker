import 'package:flutter/material.dart';
import 'package:getx_internationalization/screens/myForm.dart';
import 'package:getx_internationalization/screens/home.dart';
import 'package:getx_internationalization/screens/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.indigo),
      ),
      home: Home(),
      routes: {
        'test': (context) => Test(),
        'form': (context) => MyForm(),
      },
    );
  }
}