import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wx_reader_book/pages/book_reader_page.dart';
import 'package:wx_reader_book/pages/home_page.dart';
import 'package:wx_reader_book/route/logger_navigator_observer.dart';
import 'data_repository/repository.dart';
import 'log/logger.dart';

void main() {


  FlutterError.onError = (FlutterErrorDetails details) {
    // Catch flutter framework exceptions
    handleGlobalError(details);
  };

  runZonedGuarded(() {
    // 初始化WidgetsFlutterBinding
    WidgetsFlutterBinding.ensureInitialized();

    globalRepository.init();

    // runApp(const MyApp());


    runApp(const MyApp());

    //Unmake the status bar translucent
    SystemUiOverlayStyle systemUiOverlayStyle =const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  }, (error, stackTrace) {
    //Catch business logic code exceptions
    handleGlobalError(makeDetails(error, stackTrace));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [LoggerNavigatorObserver()],
      title: 'I love reading',
      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        BookReaderPage.routeName: (context) => BookReaderPage(),
      },
    );
  }
}

FlutterErrorDetails makeDetails(Object error, StackTrace stackTrace) {
  //make error msg
  return FlutterErrorDetails(stack: stackTrace, exception: error);
}

void handleGlobalError(FlutterErrorDetails details) {
  Logger.logEvent('Exceptions were not caught','global error:${details.exceptionAsString()}\n + stack msg: ${details.stack.toString()}');
  //... Other operations, such as logging and error reporting
}
