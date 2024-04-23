import 'package:flutter/material.dart';

class TestApp extends StatelessWidget{
  final Widget homePage;

  const TestApp(this.homePage,{super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homePage,
    );
  }
}