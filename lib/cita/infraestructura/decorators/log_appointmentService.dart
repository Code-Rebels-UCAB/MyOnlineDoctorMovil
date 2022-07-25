import 'package:firebase_analytics/firebase_analytics.dart';
import '../models/abstract_appointment_service.dart';

class LogAppointmentService implements  AbstractAppointmentService {
  AbstractAppointmentService decoratee;


  LogAppointmentService(this.decoratee);

  @override
  Future getAppointmentsOfPatient(String idPatient) async {
    var timeBefore = DateTime.now().millisecondsSinceEpoch;
    var data = await decoratee.getAppointmentsOfPatient(idPatient);
    var timeAfter = DateTime.now().millisecondsSinceEpoch - timeBefore;
    FirebaseAnalytics.instance.logEvent(name: 'ver_lista_citas', parameters: {'event_name':'ver_lista_citas'});
    print('Log: El paciente con id: $idPatient pidio ver sus citas y la respuesta tardo: $timeAfter ms');
    return data;
  }

  @override
  Future postAppointmentRequest(String idPatient, String idDoctor, String modality, String motive) async{
    var timeBefore = DateTime.now().millisecondsSinceEpoch;
    var data = await decoratee.postAppointmentRequest(idPatient, idDoctor, modality, motive);
    var timeAfter = DateTime.now().millisecondsSinceEpoch - timeBefore;
    FirebaseAnalytics.instance.logEvent(name: 'solicitar_cita', parameters: {'event_name':'solicitar_cita'});
    print('Log: El paciente con id: $idPatient solicito una cita con $idDoctor y la respuesta tardo: $timeAfter ms');
    return data;
  }

  @override
  Future postAcceptDeclineAppointment(String idAppointment, String statusAppointment) async {
    var timeBefore = DateTime.now().millisecondsSinceEpoch;
    var data = await decoratee.postAcceptDeclineAppointment(idAppointment, statusAppointment);
    var timeAfter = DateTime.now().millisecondsSinceEpoch - timeBefore;
    FirebaseAnalytics.instance.logEvent(name: 'Cita_$statusAppointment', parameters: {'event_name':'Cita_$statusAppointment'});
    print('Log: Se cambio el estado de la cita $idAppointment a $statusAppointment y la respuesta tardo: $timeAfter ms');
    return data;
  }

}