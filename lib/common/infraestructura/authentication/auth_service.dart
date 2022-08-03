

import 'package:myonlinedoctormovil/common/infraestructura/authentication/ports/auth_service_abstract.dart';

import '../models/token_jwt.dart';


class AuthService implements AuthServiceAbstract {

  final AuthServiceAbstract authToken;

  AuthService({required this.authToken});

  Future<bool> tieneToken() async {
    return await authToken.tieneToken();
  }

  Future<void> borrarToken() async {
    await authToken.borrarToken();
  }

  Future<void> escribirDataToken(TokenJwtModelo token) async {
    await authToken.escribirDataToken(token);
  }

  Future<String> leerToken() async {
    return await authToken.leerToken();
  }

}