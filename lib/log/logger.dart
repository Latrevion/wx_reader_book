import 'dart:developer' as developer;

class Logger {
  static void logEvent(String eventType, String eventDetails) {
    developer.log(
      eventDetails,
      name: eventType,
      time: DateTime.now(),
    );
  }
}
