import '../../../common/infraestructura/authentication/ports/auth_service_abstract.dart';
import '../models/token_firebase.dart';
import '../puertos/token_paciente_request_abstract.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/environment.dart';
class EnviarTokenPaciente implements TokenPacienteRequestAbstract {
  final AuthServiceAbstract authToken;

  EnviarTokenPaciente(this.authToken);
  String url = SERVER_API;

  Future<dynamic> guardarToken(TokenFirebase tokenPaciente) async {
    try {
      final token = await authToken.leerToken();
      final apiUrl = Uri.parse(url + "/api/paciente/guardar/token");
      Map<String, String> customHeaders = {
    "Content-type": "application/json",
    'Authorization': 'Bearer $token',
    };
      final response = await http.patch(apiUrl, headers: customHeaders
          , body: json.encode({
          'idPaciente':'1234',
          'tokenF':tokenPaciente.tokenF})
      ).timeout(const Duration(seconds: 15));
      return response.body;
    } catch (e) {
      throw Exception('Algo salió mal');
      }
  }
}