import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/validations.dart';
import 'package:myonlinedoctormovil/doctor/infraestructura/services/doctor_service.dart';
import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:myonlinedoctormovil/paciente/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';

import '../../../../doctor/infraestructura/decorators/log_doctors_service.dart';
import '../../../../doctor/infraestructura/models/abstract_doctor_service.dart';

class RateDoctor extends StatefulWidget {
  final String idDoctor;
  final String nombre;
  final String apellido;
  final String sexo;
  const RateDoctor({Key? key, required this.idDoctor, required this.nombre, required this.apellido, required this.sexo}) : super(key: key);

  @override
  State<RateDoctor> createState() => _RateDoctorState();
}

class _RateDoctorState extends State<RateDoctor> {
  AbstractDoctorService doctorService = LogDoctorsService(DoctorService());

  // Booleanos que manejan el cambio de apariencia de las estrellas de calificacion
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  // Ventana Dialog para calificar cita
  @override
  Widget build(BuildContext context) {

    var idPatient =
        Provider.of<IdPatientProvider>(context, listen: false).idPatient;
    //var idDoctor =
      //  Provider.of<IdDoctorProvider>(context, listen: false).idDoctor;
    //var nameDoctor = Provider.of<IdDoctorProvider>(context, listen: false).name;
    var genderDoctor =
        Provider.of<IdDoctorProvider>(context, listen: false).gender;

    return AlertDialog(
      title:  Text(
        '¿Cómo fue su experiencia con ${verifyGender(widget.sexo)} ${widget.nombre} ${widget.apellido} ?', // Agregar nombre y genero
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        overflow: TextOverflow.visible
      ),
      content: SingleChildScrollView(
        child: Row(
          children: [
            IconButton(
              icon: star1
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star1) {
                    star1 = true;
                    star2 = false;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  } else {
                    star2 = false;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star2
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star2) {
                    star1 = true;
                    star2 = true;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  } else {
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star3
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star3) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = false;
                    star5 = false;
                  } else {
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star4
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star4) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = false;
                  } else {
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star5
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star5) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = true;
                  }
                });
              }
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Enviar Calificarción'),
          onPressed: () {
            // Enviar Calificacion
            if (star1){
              if (!star2) {
                doctorService.postRatingDoctor(widget.idDoctor, idPatient, 1);
              } else if (!star3) {
                doctorService.postRatingDoctor(widget.idDoctor, idPatient, 2);
              } else if (!star4) {
                doctorService.postRatingDoctor(widget.idDoctor, idPatient, 3);
              } else if (!star5) {
                doctorService.postRatingDoctor(widget.idDoctor, idPatient, 4);
              } else if (star5) {
                doctorService.postRatingDoctor(widget.idDoctor, idPatient, 5);
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainMenuScreen()
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
