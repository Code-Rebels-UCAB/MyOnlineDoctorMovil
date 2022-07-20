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