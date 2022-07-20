class AppointmentModel {
  final String idAppointment;
  final String statusAppointment;
  final String modality;
  final DateTime dateAppointment;
  final String hourAppointment;
  final dynamic durationAppointment;
  final String idPatient;
  //final DoctorAppoinmentModel doctorAppointment;

  AppointmentModel(
      {required this.idAppointment,
      required this.statusAppointment,
      required this.modality,
      required this.dateAppointment,
      required this.hourAppointment,
      required this.durationAppointment,
      required this.idPatient,
      //required this.doctorAppointment
      });

  AppointmentModel.fromJson(Map<String, dynamic> parsedJson)
      : idAppointment = parsedJson["id_cita"],
        statusAppointment = parsedJson["statuscita"],
        modality = parsedJson["modalidad"],
        dateAppointment = parsedJson["fechaCita"],
        hourAppointment = parsedJson["horacita"],
        durationAppointment = parsedJson["duracion"],
        idPatient = parsedJson["id_paciente"];
        //doctorAppointment = DoctorAppoinmentModel.fromJson(parsedJson["doctor"]);
}

class DoctorAppoinmentModel {
  final String idDoctor;
  final String name;
  final String gender;

  DoctorAppoinmentModel({required this.idDoctor, required this.name, required this.gender});

  DoctorAppoinmentModel.fromJson(Map<String, dynamic> parsedJson)
      : idDoctor = parsedJson['id_doctor'],
        name = parsedJson['nombreDoctor'],
        gender = parsedJson['sexo'];
}
