import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/validations.dart';

class RecordItem extends StatelessWidget {
  final String nameDoctor;
  final String genderDoctor;
  final String modalityMedicalRecord;
  final String dateAppointment;

  const RecordItem(this.nameDoctor, this.genderDoctor, this.modalityMedicalRecord, this.dateAppointment, {Key? key}) : super(key: key);

  // ListTile de cada doctor
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${verifyGender(genderDoctor)} $nameDoctor', 
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Modalidad: $modalityMedicalRecord',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ), 
          Text(
            'Fecha: $dateAppointment',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ), 
        ],
      ),
      trailing: const Icon(
        Icons.info_outline,
        color: Colors.blue,
      ),
    );
  }
}