
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _streamController = new StreamController();
  static Stream<String> get messagesStream => _streamController.stream;

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token $token');
    // handlers
    FirebaseMessaging.onBackgroundMessage((message) => _backgroundHandler(message));
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }


  static Future _backgroundHandler (RemoteMessage message) async {
    print('On background Handler ${message.messageId}');
    _streamController.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler (RemoteMessage message) async {
    print('On message Handler ${message.messageId}');
    _streamController.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageOpenApp (RemoteMessage message) async {
    print('onMessageOpenApp ${message.messageId}');
    _streamController.add(message.notification?.title ?? 'No title');
  }

  static closeStreams(){
    _streamController.close();
  }
}