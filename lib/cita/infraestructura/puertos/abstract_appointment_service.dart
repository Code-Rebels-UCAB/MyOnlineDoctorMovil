abstract class AbstractAppointmentService {
  Future getAppointmentsOfPatient(String idPatient);
  Future postAppointmentRequest(String idPatient, String idDoctor, String modality, String motive);
  Future postAcceptDeclineAppointment(String idAppointment, String statusAppointment);
}