

class IniciarSesionPacienteModelo {
    final String correoPaciente;
    final String passwordPaciente;

    const IniciarSesionPacienteModelo({
      required this.correoPaciente,
      required this.passwordPaciente,
    });

    factory IniciarSesionPacienteModelo.fromJson(Map<String, dynamic> json){
      return IniciarSesionPacienteModelo(
        correoPaciente: json['correoPaciente'],
        passwordPaciente: json['passwordPaciente'],
      );
    }

}