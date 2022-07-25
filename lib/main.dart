import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/config/app_router.dart';
import 'package:myonlinedoctormovil/common/providers/notification_provider.dart';
import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';
import 'common/infraestructura/llamada_entrante.dart';
import 'common/infraestructura/push_notificaciones_servicio.dart';

// Necesario para emulador samsung externo (Alines)
class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/////////////////////////////////////////////////////////////
void main() async {
  // Necesario para emulador samsung externo (Alines)
  HttpOverrides.global = MyHttpoverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /////////////////////////////////////////////////////////////
  runApp(const MyApp());
}
  
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get doctorService => null;

  final GlobalKey<NavigatorState> navigatorKey =
       GlobalKey<NavigatorState>();

  @override
  void initState() {
    PushNotificationService.messagesStream.listen((event) async {
      final split = event.split(",");
      final channelName = split[0].split(':')[1];
      final token = split[1].split(':')[1];
      print('AQUi');
      print(channelName);
      print(token);
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => IncomingCall(
          image: 'eeee',
          channelName: channelName.trim(),
          token: token.trim(),
        ),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => IdPatientProvider()), 
        Provider(create: (context) => IdDoctorProvider()),
        Provider(create: (context) => NotificationProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          //debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'myOnlineDoctor',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //Generador de rutas para navegacion
          onGenerateRoute: AppRouter.onGenerateRoute,
          // Screen Inicial
          initialRoute: '/mainmenu',
          home: const MainMenuScreen(),
        );
      },
    );
  }
}
