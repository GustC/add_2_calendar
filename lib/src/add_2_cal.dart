import 'dart:async';

import 'package:add_2_calendar/src/model/event.dart';
import 'package:flutter/services.dart';

class Add2Calendar {
  bool _status = false;
  static const MethodChannel _channel =
      const MethodChannel('add_2_calendar');

  static const EventChannel _eventChannel = 
      const EventChannel('event_status');

  static Stream eventStatus = _eventChannel.receiveBroadcastStream();

  /// Add an Event (object) to user's default calendar.
  static Future<bool?> addEvent2Cal(Event event) async {
    final result = await _channel
        .invokeMethod<bool?>('add2Cal', event.toJson());
    if(result == true){
      bool status = await eventStatus.first;
      return status;
    }
    return result;
   
    
  }
}
