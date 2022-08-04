import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctormovil/paciente/infraestructura/models/registro_paciente.dart';
import 'dart:convert';
import '../../../common/environment.dart';

class RegistroPacienteService {
  String url = SERVER_API;

  Future registrarPaciente(RegistrarPacienteModelo registro) async {
    String id = registro.birthday;
    try {
      final apiUrl = Uri.parse(url + "/api/paciente/registrarse");
      final response = await http.post(
        apiUrl,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          "id_paciente": id,
          "p_nombre": registro.firstName,
          "s_nombre": registro.middleName,
          "p_apellido": registro.lastName,
          "s_apellido": registro.surName,
          "sexo": registro.gender  == "Masculino" ? "M" : "F",
          "fecha_nacimiento": registro.birthday,
          "altura": int.parse(registro.height),
          "peso": int.parse( registro.weight),
          "telefono": registro.phone,
          "correo": registro.email,
          "contrasena": registro.password,
          "antecedentes": registro.record,
          "operacion": registro.operations,
          "alergia": registro.alergies,
          "status_suscripcion": "Activo",
        }),
      );//.timeout(const Duration(seconds: 15));
    } catch (e) {
      throw Exception('Algo salio mal');
    }
  }
}
