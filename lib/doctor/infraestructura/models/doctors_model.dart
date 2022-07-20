class DoctorModel {
  final String idDoctor;
  final String name;
  final String gender;
  final String mail;
  final List<dynamic> specialties;
  final String photo;
  final dynamic rating;

  DoctorModel(
      {required this.idDoctor,
      required this.name,
      required this.gender,
      required this.mail,
      required this.specialties,
      required this.photo, 
      required this.rating
      });

  DoctorModel.fromJson(Map<String, dynamic> parsedJson)
      : idDoctor = parsedJson['id_doctor'],
        name = parsedJson['nombre'],
        gender = parsedJson['sexo'],
        mail = parsedJson['correo'],
        specialties = parsedJson['especialidades'],
        photo = parsedJson['foto'],
        rating = parsedJson['calificacion'];
}
