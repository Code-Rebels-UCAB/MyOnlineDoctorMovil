class MedicalRecordProvider {
  late String idMedicalRecord;
  late String examMedicalRecord;
  late String historyMedicalRecord;
  late String prescriptionMedicalRecord;
  late String planMedicalRecord;
  late String diagnosisMedicalRecord;
  late String motiveMedicalRecord;
  late String modalityMedicalRecord;
  late String idDoctor;
  late String nameDoctor;
  late String genderDoctor;
  late String idAppointment;
  late String dateAppointment;
  late String idPatient;
  late String idHistory;

  void setMedicalRecord(Map<dynamic, dynamic> medicalRecord) {
    idMedicalRecord = medicalRecord["id_registro"];
    examMedicalRecord = medicalRecord["examenes"];
    historyMedicalRecord = medicalRecord["historia"];
    prescriptionMedicalRecord = medicalRecord["prescripcion"];
    planMedicalRecord = medicalRecord["plan"];
    diagnosisMedicalRecord = medicalRecord["diagnostico"];
    motiveMedicalRecord = medicalRecord["motivo"];
    modalityMedicalRecord = medicalRecord["modalidad"];
    idDoctor = medicalRecord["id_doctor"];
    nameDoctor = medicalRecord["nombreDoctor"];
    genderDoctor = medicalRecord["sexoDoctor"];
    idAppointment = medicalRecord["id_cita"];
    dateAppointment = medicalRecord["fechaCita"];
    idPatient = medicalRecord["id_paciente"];
    idHistory = medicalRecord["id_historia"];
  }
}