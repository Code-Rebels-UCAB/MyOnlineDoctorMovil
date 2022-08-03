class RegistrarPacienteModelo {
  final String firstName;
  final String middleName;
  final String lastName;
  final String surName;
  final String gender;
  final String birthday;
  final String height;
  final String weight;
  final String phone;
  final String email;
  final String password;
  final String record;
  final String operations;
  final String alergies;

  const RegistrarPacienteModelo({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.surName,
    required this.gender,
    required this.birthday,
    required this.height,
    required this.weight,
    required this.phone,
    required this.email,
    required this.password,
    required this.record,
    required this.operations,
    required this.alergies,
  });

  /*factory RegistrarPacienteModelo.fromJson(Map<String, dynamic> json) {
    return RegistrarPacienteModelo(
      correoPaciente: json['correoPaciente'],
      passwordPaciente: json['passwordPaciente'],
    );
  }*/
}
