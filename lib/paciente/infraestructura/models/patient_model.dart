class PatientModel {
  String idPatient;
  String name;
  /*DateTime birthDate;
  String gender;
  String mail;
  int phoneNum;
  double height;
  double weight;
  String background;
  String operations;
  String alergies;
  String statusSubscription;*/

  PatientModel({
    required this.idPatient,
    required this.name,
    /*this.birthDate, this.gender, this.mail, this.phoneNum, this.height, this.weight, this.background, this.operations, this.alergies, this.statusSubscription*/
  });

  PatientModel.fromJson(Map<String, dynamic> parsedJson)
      : idPatient = parsedJson['id_cita'],
        name = parsedJson['statuscita'];
}
