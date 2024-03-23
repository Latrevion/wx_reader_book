import 'package:flutter/material.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Called when a new route is pushed into the navigator
    //Perform actions such as route statistics or logging
    print('New route pushed:${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute){
    //Called when a route pops up from the navigator
    // Called when a route pops up from the navigator
    print('Route poped:${route.settings.name}');
  }
}
