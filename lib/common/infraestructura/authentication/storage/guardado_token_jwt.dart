
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myonlinedoctormovil/common/infraestructura/models/token_jwt.dart';
import '../ports/auth_service_abstract.dart';

class GuardadoTokenJwt implements AuthServiceAbstract{

  final _almacenamiento = const FlutterSecureStorage();

  Future<void> escribirDataToken(TokenJwtModelo token) async {
    await _almacenamiento.write(
        key: 'token', value: token.token.toString());
  }

  borrarToken() async {
    await _almacenamiento.deleteAll();
  }

  Future<String> leerToken() async {
    return await _almacenamiento.read(key: 'token') as String;
  }

  Future<bool> tieneToken() async {
    String? token = await GuardadoTokenJwt().leerToken();
    if (token != null) {
      return true;
    }
    return false;
  }
}