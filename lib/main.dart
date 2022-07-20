import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/config/app_router.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  get doctorService => null;
  
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService.messagesStream.listen((event) async {
      navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) =>const IncomingCall(image: 'eeee',),
          )
      );
    });
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































void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();


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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  get doctorService => null;

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
