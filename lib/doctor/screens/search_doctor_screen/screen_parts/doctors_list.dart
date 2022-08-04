import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/doctor/infraestructura/models/doctors_model.dart';
import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/screen_parts/doctor_item.dart';
import 'package:myonlinedoctormovil/cita/screens/request_appointment_screen.dart';
import 'package:provider/provider.dart';

import '../../../../paciente/infraestructura/services/enviar_token_paciente.dart';

class DoctorList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final DoctorModel item;

  const DoctorList(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (item.status == 'Activo')
        ? GestureDetector(
            // Se agrega la lista de Widgets, cada uno con la informacion de un doctor
            child: DoctorItem(item.idDoctor, item.name, item.gender, item.mail,
                item.specialties, item.photo, item.rating),
            // Al hacer click sobre el doctor se abre una ventana para Solicitar Cita
            onTap: () {
              Provider.of<IdDoctorProvider>(context, listen: false)
                  .setIdPatient(item.idDoctor, item.name, item.gender);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RequestAppoinment();
                },
              );
            })
        : const SizedBox.shrink();
  }
}
