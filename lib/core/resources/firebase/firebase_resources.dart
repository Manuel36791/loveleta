import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/app_constants.dart';

class FireBaseResources {
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  android() async {
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    AppConstants.fcmToken = await messaging.getToken();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }

  ios() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
    // String? token = await messaging.getToken();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage remoteMessage) {});
  }
}
