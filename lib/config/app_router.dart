import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/cita/screens/appointments_screen/appointments_screen.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/search_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';

// Router de interfaces de aplicacion
class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Listado de Citas
      case '/appointments':
        return AppointmentsScreen.route();
      // Busqueda de Doctores
      case '/search':
        return SearchScreen.route();
      // Menu Principal
      case '/mainmenu':
        return MainMenuScreen.route();
      default:
        return MaterialPageRoute(builder: (context) => Center(child: Text("404: No route found for path ${settings.name}")));
    }
  }
}
