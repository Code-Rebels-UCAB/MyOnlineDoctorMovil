import '../models/token_firebase.dart';

abstract class TokenPacienteRequestAbstract {
  Future<Null> guardarToken(TokenFirebase tokenPaciente);
}