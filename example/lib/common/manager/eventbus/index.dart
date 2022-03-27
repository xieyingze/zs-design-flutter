import 'dart:async';

import 'package:event_bus/event_bus.dart';

export './events.dart';

typedef void EventCallback<T>(T event);

//EventBus工具类
class EventBusManager {
  static final EventBusManager _singleton = EventBusManager._();
  static EventBusManager get instance => _singleton;
  EventBusManager._();

  //初始化eventBus
  EventBus _eventBus = EventBus();

  /*
   * @description   开启eventBus订阅
   * @param         
   * @return        
   * @author        jay    
   * @time          1/11/22 12:10 PM  
   */
  StreamSubscription on<T>(EventCallback<T> callback) {
    StreamSubscription stream = _eventBus.on<T>().listen((event) {
      callback(event);
    });
    return stream;
  }

  /*
   * @description   发送消息
   * @param         
   * @return        
   * @author        jay    
   * @time          1/11/22 12:10 PM  
   */
  void emit(event) {
    _eventBus.fire(event);
  }

  /*
   * @description   移除steam
   * @param         
   * @return        
   * @author        jay
   * @time          1/11/22 12:10 PM  
   */
  void off(StreamSubscription steam) {
    steam.cancel();
  }
}

var eventBusInstance = EventBusManager.instance;
