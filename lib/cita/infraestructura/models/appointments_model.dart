class AppointmentModel {
  final String idAppointment;
  final String statusAppointment;
  final String modality;
  final String hourAppointment;
  final DoctorAppoinmentModel doctorAppointment;

  AppointmentModel(
      {required this.idAppointment,
      required this.statusAppointment,
      required this.modality,
      required this.hourAppointment,
      required this.doctorAppointment});

  AppointmentModel.fromJson(Map<String, dynamic> parsedJson)
      : idAppointment = parsedJson['id_cita'],
        statusAppointment = parsedJson['statuscita'],
        modality = parsedJson['modalidad'],
        hourAppointment = parsedJson['horacita'],
        doctorAppointment = DoctorAppoinmentModel.fromJson(parsedJson['doctor']);
}

class DoctorAppoinmentModel {
  final String idDoctor;
  final String name;
  final String lastName;

  DoctorAppoinmentModel(
      {required this.idDoctor,
      required this.name,
      required this.lastName});

  DoctorAppoinmentModel.fromJson(Map<String, dynamic> parsedJson)
      : idDoctor = parsedJson['id_doctor'],
        name = parsedJson['p_nombre'],
        lastName = parsedJson['p_apellido'];
}