
import 'package:firebase_analytics/firebase_analytics.dart';
import '../models/abstract_doctor_service.dart';

class LogDoctorsService implements  AbstractDoctorService {
  AbstractDoctorService decoratee;

  LogDoctorsService(this.decoratee);

  Future<List<dynamic>> getDoctors(String dropdownFilter, String searchValue) async {
    var timeBefore = DateTime.now().millisecondsSinceEpoch;
    var data = await decoratee.getDoctors(dropdownFilter,searchValue);
    var timeAfter = DateTime.now().millisecondsSinceEpoch - timeBefore;
    FirebaseAnalytics.instance.logEvent(name: 'busqueda_doctores', parameters: {'event_name':'busqueda_doctores'});
    print('Log: El paciente busco doctores de tipo: $dropdownFilter la respuesta tardo: $timeAfter ms');
    return data;
  }

  Future postRatingDoctor(String idDoctor, String idPatient, dynamic raiting) async {
    var timeBefore = DateTime.now().millisecondsSinceEpoch;
    var data = await decoratee.postRatingDoctor(idDoctor,idPatient,raiting);
    var timeAfter = DateTime.now().millisecondsSinceEpoch - timeBefore;
    FirebaseAnalytics.instance.logEvent(name: 'calificar_doctor', parameters: {'event_name':'calificar_doctor'});
    print('Log: El paciente con id: $idPatient calificó al doctor con id: $idDoctor con la calificación de $raiting estrella y la respuesta tardo: $timeAfter ms');
    return data;
  }
}