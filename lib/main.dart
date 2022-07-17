import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/comun/infraestructura/index.dart';

import 'comun/infraestructura/push_notificaciones_servicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService.messagesStream.listen((event) async {
      print('MyApp: $event');
    });

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      // scaffoldMessengerKey: ,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const IndexPage(),
    );
  }
}
