import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wx_reader_book/pages/home_page.dart';

void main() {
  runApp(const MyApp());

  //Unmake the status bar translucent
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I love reading',
      initialRoute: '/',
      routes: {
      "/":(context)=>  HomePage(),
      },
    );
  }
}

