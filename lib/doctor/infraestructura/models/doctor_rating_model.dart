class DoctorRatingModel {
  final String idDoctor;
  final dynamic rating;

  DoctorRatingModel(
      {required this.idDoctor,
      required this.rating
      });

  /*DoctorRatingModel.fromJson(Map<String, dynamic> parsedJson)
      : idDoctor = parsedJson['id_doctor'],
        name = parsedJson['nombre'],
        gender = parsedJson['sexo'],
        mail = parsedJson['correo'],
        specialties = parsedJson['especialidades'],
        photo = parsedJson['foto'],
        rating = parsedJson['calificacion'];*/
}
