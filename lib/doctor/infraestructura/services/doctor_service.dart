import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myonlinedoctormovil/doctor/infraestructura/models/doctors_model.dart';
import '../models/abstract_doctor_service.dart';
import '../../../common/environment.dart';
class DoctorService implements AbstractDoctorService{

  Future<List<dynamic>> getDoctors(
      String dropdownFilter, String searchValue) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;

    if (dropdownFilter == 'Nombre y Apellido' && searchValue.isNotEmpty) {
      response = await http.get(Uri.parse(
        //"http://localhost:3000/api/doctor/filtrar/nombre?nombre=$searchValue"

        // Alines
          "${SERVER_API}/api/doctor/filtrar/nombre?nombre=$searchValue"
      ));
    } else if (dropdownFilter == 'Especialidad' && searchValue.isNotEmpty) {
      response = await http.get(Uri.parse(
        //"http://localhost:3000/api/doctor/filtrar/especialidad?especialidad=$searchValue"

        // Alines
          "${SERVER_API}/api/doctor/filtrar/especialidad?especialidad=$searchValue"
      ));
    } else if (dropdownFilter == 'Top Doctores') {
      response = await http
          .get(Uri.parse(
        //"http://localhost:3000/api/doctor/filtrar/top"

        // Alines
          "${SERVER_API}/api/doctor/filtrar/top"
      ));
    } else {
      response = await http.get(Uri.parse(
        //"http://localhost:3000/api/doctor/todos"

        // Alines
          "${SERVER_API}/api/doctor/todos"));
    }

    var jsonResponse = jsonDecode(response.body);
    return jsonResponse["valor"]
        .map((doctors) => DoctorModel.fromJson(doctors))
        .toList();
  }

  Future postRatingDoctor(String idDoctor, String idPatient, dynamic raiting) async {

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse(
      //'http://localhost:3000/api/doctor/calificar'

      // Alines
        '${SERVER_API}/api/doctor/calificar'
    ));

    request.body = json.encode({
      "idDoctor": idDoctor,
      "idPaciente": idPatient,
      "calificacionDoctor": raiting
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}