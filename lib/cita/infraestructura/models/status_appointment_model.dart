class AcceptDeclineAppointmentModel {
  final String idAppointment;
  final String statusAppointment;

  AcceptDeclineAppointmentModel({
    required this.idAppointment,
    required this.statusAppointment,
  });

  /*AcceptDeclineAppointmentModel.toJson(Map<String, dynamic> parsedJson)
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
