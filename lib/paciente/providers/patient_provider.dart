class PatientProvider {
  late String idPatient;
  late String firstNamePatient;
  late String? middleNamePatient;
  late String lastNamePatient;
  late String? surNamePatient;
  late String genderPatient;
  late String heightPatient;
  late String weightPatient;
  late String phonePatient;
  late String? recordPatient;
  late String? operationsPatient;
  late String? alergiesPatient;
  late String statusSuscriptionPatient;
  late String emailPatient;
  late String birthdayPatient;
  void setPatient(Map<String, dynamic> patientInfo) {
    idPatient = patientInfo["valor"]["id_paciente"];
    firstNamePatient = patientInfo["valor"]["p_nombre"];
    middleNamePatient = patientInfo["valor"]["s_nombre"];
    lastNamePatient = patientInfo["valor"]["p_apellido"];
    surNamePatient = patientInfo["valor"]["s_apellido"];
    genderPatient = patientInfo["valor"]["sexo"];
    heightPatient = patientInfo["valor"]["altura"];
    weightPatient = patientInfo["valor"]["peso"];
    phonePatient = patientInfo["valor"]["telefono"];
    recordPatient = patientInfo["valor"]["antecedentes"];
    operationsPatient = patientInfo["valor"]["operacion"];
    alergiesPatient = patientInfo["valor"]["alergia"];
    statusSuscriptionPatient = patientInfo["valor"]["status_suscripcion"];
    emailPatient = patientInfo["valor"]["correo"];
    birthdayPatient = patientInfo["valor"]["fecha_nacimiento"];
  }
}
