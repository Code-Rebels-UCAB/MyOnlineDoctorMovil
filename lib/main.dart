import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myonlinedoctormovil/common/config/app_router.dart';
import 'package:myonlinedoctormovil/common/providers/notification_provider.dart';
import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:myonlinedoctormovil/paciente/screens/login_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';
import 'cita/screens/appointments_screen/appointments_screen.dart';
import 'common/infraestructura/llamada_entrante.dart';
import 'common/infraestructura/push_notificaciones_servicio.dart';
import 'common/viewNotification.dart';
import 'registro_medico/providers/medical_record_provider.dart';

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
  final ViewNotificacions = new ViewNotificacion();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  @override
  void initState() {

    PushNotificationService.messagesStream.listen((event) async {
      ViewNotificacions.ViewNotification(event,context,navigatorKey);
    });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => PatientProvider()), 
        Provider(create: (context) => IdDoctorProvider()),
        Provider(create: (context) => NotificationProvider()),
        Provider(create: (context) => MedicalRecordProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          //debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          //scaffoldMessengerKey: messengerKey,
          title: 'myOnlineDoctor',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //Generador de rutas para navegacion
          onGenerateRoute: AppRouter.onGenerateRoute,
          // Screen Inicial
          initialRoute: 'home',
          routes: {
            'home': (_) => const MainMenuScreen(), //LoginScreen(),
          }
        );
      },
    );
  }
}
