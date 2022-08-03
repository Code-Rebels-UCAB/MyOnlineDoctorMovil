

import 'dart:async';

import '../../models/token_jwt.dart';

abstract class AuthServiceAbstract {
  Future<bool> tieneToken();
  Future<void> borrarToken();
  Future<void> escribirDataToken(TokenJwtModelo token);
  Future<String> leerToken();

}