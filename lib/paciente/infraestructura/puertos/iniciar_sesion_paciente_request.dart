
import 'package:myonlinedoctormovil/common/infraestructura/models/token_jwt.dart';

import '../models/iniciar_sesion_paciente.dart';

abstract class IniciarSesionPacienteRequest {
  Future<TokenJwtModelo> iniciarSesionPacienteRequest(IniciarSesionPacienteModelo credenciales);
}