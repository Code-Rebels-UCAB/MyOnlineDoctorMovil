import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String idDoctor;
  final String name;
  final String gender;
  final String mail;
  final List<dynamic> specialties;
  final String photo;
  final dynamic rating;

  const DoctorItem(this.idDoctor, this.name, this.gender, this.mail, this.specialties, this.photo, this.rating, 
      {Key? key})
      : super(key: key);

  // ListTile de cada doctor
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: verifyPhoto(photo),
        radius: 30,
      ),
      title: Text('${verifyGender(gender)} $name'),
      subtitle: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft, 
            child: Text(
              verifySpecialty(specialties),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top:22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$rating', 
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Verifica si hay imagen guardada y colocar un suplente en caso contrario
  ImageProvider verifyPhoto(String? photoRoute) {
    if (photoRoute!.isEmpty) {
      return const NetworkImage(
          'https://drive.google.com/uc?export=view&id=1KkKZ0bCSwVhhqhS5zIqw3Y5MBlQq0zs3');
    } else {
      return NetworkImage(photoRoute);
    }
  }

  // Verifica el genero del medico
  String verifyGender(String gender) {
    if (gender == 'F') {
      return "Dra.";
    } else {
      return "Dr.";
    }
  }
}

// Verifica la cantidad de especialidades del medico
String verifySpecialty(dynamic specialtyList) {
  String specialities = '';

  if (specialtyList.isNotEmpty) {
    if (specialtyList.length > 1) {
      for (var item in specialtyList) {
        if (item == specialtyList[0]) {
          specialities = specialtyList[0];
        } else {
          specialities = '$specialities, $item';
        }
      }
      return specialities;
    }
    return specialtyList[0];
  } else {
    return 'Medico Cirujano';
  }
}
