import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/config/app_router.dart';
import 'package:myonlinedoctormovil/common/providers/notification_provider.dart';
import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';
import 'cita/screens/appointments_screen/appointments_screen.dart';
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

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //final GlobalKey<ScaffoldMessengerState> messengerKey= GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    PushNotificationService.messagesStream.listen((event) async {
      try {
        final split = event.data.values.toString().split(",");
        final title =  split[0].split(':')[1];
        if(title == 'llamada entrante'){
          final channelName = split[1].split(':')[1];
          final token = split[2].split(':')[1];
          final sexo = split[3].split(':')[1];
          final nombre = split[4].split(':')[1];
          final apellido = split[5].split(':')[1];
          final idDoctor = split[6].split(':')[1];
          final foto = split[7].split(')')[0];
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => IncomingCall(
              idDoctor: idDoctor.trim(),
              nombre: nombre.trim(),
              apellido: apellido.trim(),
              sexo: sexo.trim(),
              image: foto.trim(),
              channelName: channelName.trim(),
              token: token.trim(),
            ),
          ));
        }
        else if(title == 'doctor agenda cita'){

          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => AppointmentsScreen(),
          ));
        }
        else if(title == 'doctor suspende cita'){
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => AppointmentsScreen(),
          ));
        }
        else if(title == 'doctor registra historia medica'){
          //navigatorKey.currentState?.push(MaterialPageRoute(
            //builder: (context) => medicalRecordScreen(),
          //));
        }
      } catch (e) {
        //catch
      }
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
            'home': (_) => MainMenuScreen(),
          }
        );
      },
    );
  }
}
