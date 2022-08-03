

import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/paciente/infraestructura/puertos/iniciar_sesion_paciente_request.dart';

import '../../common/infraestructura/models/token_jwt.dart';
import '../infraestructura/models/iniciar_sesion_paciente.dart';

class IniciarSesionEstado with ChangeNotifier {
  final IniciarSesionPacienteRequest request;

  IniciarSesionEstado(this.request);


  Future<void> iniciarSesion(IniciarSesionPacienteModelo credenciales) async{
    try{
      final response = await request.iniciarSesionPacienteRequest(credenciales);
      print("aqui");
      print(response);
      notifyListeners();
    }catch(e){
      throw Exception("Algo Salio mal");
    }
  }


}
