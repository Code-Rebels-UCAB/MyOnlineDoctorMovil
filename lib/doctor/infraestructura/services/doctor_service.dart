import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:myonlinedoctormovil/doctor/infraestructura/models/doctors_model.dart';

class DoctorService {
  Future<List<dynamic>> getDoctors(
      String dropdownFilter, String searchValue) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;

    if (dropdownFilter == 'Nombre y Apellido' && searchValue.isNotEmpty) {
      response = await http.get(Uri.parse(
          "http://10.0.2.2:3000/api/doctor/filtrar/nombre?nombre=$searchValue"
          //"http://192.168.8.100:3005/api/doctor/filtrar/nombre?nombre=$searchValue"
          //"http://10.0.1.12:3005/api/doctor/filtrar/nombre?nombre=$searchValue"
          ));
    } else if (dropdownFilter == 'Especialidad' && searchValue.isNotEmpty) {
      response = await http.get(Uri.parse(
          "http://10.0.2.2:3000/api/doctor/filtrar/especialidad?especialidad=$searchValue"
          //"http://192.168.8.100:3005/api/doctor/filtrar/especialidad?especialidad=$searchValue"
          //"http://10.0.1.12:3005/api/doctor/filtrar/especialidad?especialidad=$searchValue"
          ));
    } else if (dropdownFilter == 'Top Doctores') {
      response = await http
          .get(Uri.parse("http://10.0.2.2:3000/api/doctor/filtrar/top"
              //"http://192.168.8.100:3005/api/doctor/filtrar/top"
              //"http://10.0.1.12:3005/api/doctor/filtrar/top"
              ));
    } else {
      response =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/doctor/todos"
              //"http://192.168.8.100:3005/api/doctor/todos"
              //"http://10.0.1.12:3005/api/doctor/todos"
              ));
    }

    var jsonResponse = convert.jsonDecode(response.body);
    var hola;
    hola = jsonResponse["valor"].map((doctors) => DoctorModel.fromJson(doctors)).toList();

    print(hola[0].name);
    return hola;
  }

  /*Future <DoctorRatingModel> postRatingDoctor (String idDoctor, dynamic raiting) async {
    return
  } */
}
