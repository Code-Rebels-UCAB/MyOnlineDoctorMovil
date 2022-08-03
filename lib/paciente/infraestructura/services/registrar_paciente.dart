import 'package:http/http.dart' as http;
import 'package:myonlinedoctormovil/paciente/infraestructura/models/registro_paciente.dart';
import 'dart:convert';
import '../../../common/environment.dart';

class RegistroPacienteService {
  Future registrarPaciente(RegistrarPacienteModelo registro) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('${SERVER_API}/api/paciente/registrarse'));

    String id = registro.birthday;

    request.body = json.encode({
      "id_paciente": id,
      "p_nombre": registro.firstName,
      "s_nombre": registro.middleName,
      "p_apellido": registro.lastName,
      "s_apellido": registro.surName,
      "sexo": registro.gender,
      "fecha_nacimiento": registro.birthday,
      "altura": registro.height,
      "peso": registro.weight,
      "telefono": registro.phone,
      "correo": registro.email,
      "contrasena": registro.password,
      "antecedentes": registro.record,
      "operacion": registro.operations,
      "alergia": registro.alergies,
      "status_suscripcion": "Activa",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
