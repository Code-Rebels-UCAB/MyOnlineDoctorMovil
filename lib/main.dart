import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/config/app_router.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'common/infraestructura/llamada_entrante.dart';
import 'common/infraestructura/push_notificaciones_servicio.dart';
import 'common/infraestructura/llamada.dart';
import 'common/infraestructura/index.dart';



// Necesario para emulador samsung externo (Alines)
class MyHttpoverrides extends HttpOverrides{
  @override 
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
  }
}
/////////////////////////////////////////////////////////////
void main() {
  // Necesario para emulador samsung externo (Alines)
  HttpOverrides.global=MyHttpoverrides();
  /////////////////////////////////////////////////////////////
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get doctorService => null;

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    PushNotificationService.messagesStream.listen((event) async {
      navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) =>const IncomingCall(image: 'eeee',),
          )
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'myOnlineDoctor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Generador de rutas para navegacion
      onGenerateRoute: AppRouter.onGenerateRoute,
      // Screen Inicial
      //onGenerateInitialRoutes:
      home: const MainMenuScreen(),
    );
  }
}





























