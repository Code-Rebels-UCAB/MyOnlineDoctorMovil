import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/cita/screens/appointments_screen/appointments_screen.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/search_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/login_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/patient_info_screen.dart';
import 'package:myonlinedoctormovil/paciente/screens/register_screen/register_screen.dart';
import 'package:myonlinedoctormovil/registro_medico/screens/medical_records_screen/medical_records_screen.dart';

import '../../paciente/infraestructura/services/enviar_token_paciente.dart';
import '../infraestructura/authentication/auth_service.dart';
import '../infraestructura/authentication/storage/guardado_token_jwt.dart';

// Router de interfaces de aplicacion
class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Registro Medico de Paciente
      case '/medicalRecord':
        return MaterialPageRoute(builder: (_) => const MedicalRecordsScreen());
      // Registro de Paciente
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      // Inicio de Sesion de Paciente
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // Informacion Paciente
      case '/patientinfo':
        return MaterialPageRoute(builder: (_) => const PatientInfoScreen());
      // Listado de Citas
      case '/appointments':
        return MaterialPageRoute(builder: (_) => const AppointmentsScreen());
      // Busqueda de Doctores
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      // Menu Principal
      case '/mainmenu':
        return MaterialPageRoute(builder: (_) => const MainMenuScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Center(
                child: Text("404: No route found for path ${settings.name}")));
    }
  }
}
