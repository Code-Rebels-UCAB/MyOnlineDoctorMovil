import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/validations.dart';
import 'package:myonlinedoctormovil/registro_medico/providers/medical_record_provider.dart';
import 'package:provider/provider.dart';

class MedicalRecordInfoDialog extends StatelessWidget {
  const MedicalRecordInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var nameDoctor = Provider.of<MedicalRecordProvider>(context, listen: false).nameDoctor;
    var genderDoctor = Provider.of<MedicalRecordProvider>(context, listen: false).genderDoctor;
    var dateAppointment = Provider.of<MedicalRecordProvider>(context, listen: false).dateAppointment;
    var motiveMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).motiveMedicalRecord;
    var modalityMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).modalityMedicalRecord;
    var historyMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).historyMedicalRecord;
    var diagnosisMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).diagnosisMedicalRecord;
    var planMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).planMedicalRecord;
    var examMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).examMedicalRecord;
    var prescriptionMedicalRecord = Provider.of<MedicalRecordProvider>(context, listen: false).prescriptionMedicalRecord;

    return AlertDialog(
      title: Center(
        child: Text(
          '${verifyGender(genderDoctor)} $nameDoctor', 
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.date_range_rounded, 
                color: Colors.blue,
              ),
              Text(
                '$dateAppointment', 
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 18, 

                ),
              ),
            ]
          ),

          Text(
            'Modalidad: $modalityMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ), 
          const Spacer(),

          Text(
            'Motivo: $motiveMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),

          const Text(
            'Historia:', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          Text(
            '$historyMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),

          const Text(
            'Diagnóstico:', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          Text(
            '$diagnosisMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),

          const Text(
            'Plan:', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          Text(
            '$planMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),

          const Text(
            'Examenes:', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          Text(
            '$examMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),

          const Text(
            'Prescripción:', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          Text(
            '$prescriptionMedicalRecord', 
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 18
            ),
          ),
          const Spacer(),
        ],
      ),
      actions: [
        TextButton(
          child: const Text(
            'Salir',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}