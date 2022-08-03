
import 'dart:convert';
import 'dart:io';
import 'package:myonlinedoctormovil/common/infraestructura/authentication/storage/guardado_token_jwt.dart';
import 'package:myonlinedoctormovil/common/infraestructura/models/token_jwt.dart';
import 'package:myonlinedoctormovil/paciente/infraestructura/models/iniciar_sesion_paciente.dart';
import '../../../common/environment.dart';
import '../../../common/infraestructura/authentication/ports/auth_service_abstract.dart';
import '../puertos/iniciar_sesion_paciente_request.dart';
import 'package:http/http.dart' as http;


class IniciarSesionPacienteService implements IniciarSesionPacienteRequestAbstract {

  String url = SERVER_API;
  final AuthServiceAbstract authToken;

  IniciarSesionPacienteService(this.authToken);

  Future<TokenJwtModelo> iniciarSesionPacienteRequest(IniciarSesionPacienteModelo credenciales) async {
    try {
      final apiUrl = Uri.parse(url + "/api/paciente/auth/iniciarsesion");
      final response = await http.post(
          apiUrl,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        body: json.encode({
          "correoPaciente": credenciales.correoPaciente, "passwordPaciente": credenciales.passwordPaciente
        }),
         ).timeout(const Duration(seconds: 15));
      final respuestaExtraida = json.decode(response.body)['valor'];
      final token = TokenJwtModelo.fromJson(respuestaExtraida);
      await authToken.escribirDataToken(token);
      return token;
    } catch (e) {
      throw Exception('Algo salio mal');
    }
  }
}