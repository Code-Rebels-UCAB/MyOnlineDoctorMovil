class RequestAppointmentModel {
  final String idPatient;
  final String idDoctor;
  final String modality;
  final String motive;

  RequestAppointmentModel(
      {required this.idPatient,
      required this.idDoctor,
      required this.modality,
      required this.motive,});

  /*RequestAppointmentModel.toJson(Map<String, dynamic> parsedJson)
      : idPatient = parsedJson['id_paciente'],
        idDoctor = parsedJson['id_cita'],
        statusAppointment = parsedJson['statuscita'],
        modality = parsedJson['modalidad'],
        dateAppointment = parsedJson['fechaCita'],
        hourAppointment = parsedJson['horacita'],
        durationAppointment = parsedJson['duracion'],
        idPatient = parsedJson['id_paciente'],
        doctorAppointment =
            DoctorAppoinmentModel.fromJson(parsedJson['doctor']);*/
}