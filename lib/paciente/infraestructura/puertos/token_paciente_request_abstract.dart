import '../models/token_firebase.dart';

abstract class TokenPacienteRequestAbstract {
  Future<void> guardarToken(TokenFirebase tokenPaciente);
}