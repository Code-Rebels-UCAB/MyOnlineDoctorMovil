import '../modelo/token_firebase.dart';

abstract class TokenPacienteRequestAbstract {
  Future<Null> guardarToken(TokenFirebase tokenPaciente);
}