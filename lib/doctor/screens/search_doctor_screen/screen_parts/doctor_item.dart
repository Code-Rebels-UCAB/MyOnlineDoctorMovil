import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String idDoctor;
  final String name;
  final String gender;
  final String mail;
  final List<String> specialties;
  final double rating;
  final String photoRoute;

  const DoctorItem(this.idDoctor, this.name, this.gender, this.mail, this.specialties, this.rating, this.photoRoute, 
      {Key? key})
      : super(key: key);

  // ListTile de cada doctor
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: verifyPhoto(photoRoute),
        radius: 30,
      ),
      title: Text('${verifyGender(gender)} $name'),
      subtitle: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text(verifySpecialty(specialties)),
          Text('$rating'),
        ],
      ),
    );
  }

  // Verifica si hay imagen guardada y colocar un suplente en caso contrario
  ImageProvider verifyPhoto(String? photoRoute) {
    if (photoRoute!.isEmpty) {
      return const NetworkImage(
          'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc');
    } else {
      return NetworkImage(photoRoute);
    }
  }

  // Verifica el genero del medico
  String verifyGender(String gender) {
    if (gender == 'f') {
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
