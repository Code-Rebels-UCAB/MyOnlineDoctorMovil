import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/screen_parts/doctor_item.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/screen_parts/request_appointment_dialog.dart';


class DoctorList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final item;

  const DoctorList(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Se agrega la lista de Widgets, cada uno con la informacion de un doctor
        child: DoctorItem(item['id_doctor'], item['nombre'], item['sexo'], item['correo'],item['especialidades'], item['calificacion'], item['photo']),
        // Al hacer click sobre el doctor se abre una ventana para Solicitar Cita
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const RequestAppoinment();
            },
          );
        });
  }
}
