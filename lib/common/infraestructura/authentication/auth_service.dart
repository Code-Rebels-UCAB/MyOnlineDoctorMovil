

import 'package:myonlinedoctormovil/common/infraestructura/authentication/ports/auth_service_abstract.dart';
import 'package:myonlinedoctormovil/common/infraestructura/authentication/storage/guardado_token_jwt.dart';


class AuthService implements AuthServiceAbstract {

  Future<bool> tieneToken() async {
    String? token = await GuardadoTokenJwt().leerToken();
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<void> borrarToken() async {
    await GuardadoTokenJwt().borrarToken();
  }

}