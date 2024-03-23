import 'package:flutter/material.dart';
import 'package:wx_reader_book/log/logger.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Called when a new route is pushed into the navigator
    //Perform actions such as route statistics or logging
    Logger.logEvent('page open','New route pushed:${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute){
    //Called when a route pops up from the navigator
    Logger.logEvent('page close','Route PoPed:${route.settings.name}');
  }

}
