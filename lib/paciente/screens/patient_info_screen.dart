import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:provider/provider.dart';

class PatientInfoScreen extends StatelessWidget {
  const PatientInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstNamePatient = Provider.of<PatientProvider>(context, listen: false)
        .firstNamePatient;
    String middleNamePatient = Provider.of<PatientProvider>(context, listen: false)
        .middleNamePatient ?? "";
    String lastNamePatient = Provider.of<PatientProvider>(context, listen: false)
        .lastNamePatient;
    String surNamePatient = Provider.of<PatientProvider>(context, listen: false)
        .surNamePatient ?? "";
    String genderPatient = Provider.of<PatientProvider>(context, listen: false)
        .genderPatient;
    String heightPatient = Provider.of<PatientProvider>(context, listen: false)
        .heightPatient;
    String weightPatient = Provider.of<PatientProvider>(context, listen: false)
        .weightPatient;
    String phonePatient = Provider.of<PatientProvider>(context, listen: false)
        .phonePatient;
    String recordPatient = Provider.of<PatientProvider>(context, listen: false)
        .recordPatient ?? "N/A";
    String operationsPatient = Provider.of<PatientProvider>(context, listen: false)
        .operationsPatient ?? "N/A";
    String alergiesPatient = Provider.of<PatientProvider>(context, listen: false)
        .alergiesPatient ?? "N/A";
    String statusSuscriptionPatient = Provider.of<PatientProvider>(context, listen: false)
        .statusSuscriptionPatient;
    String emailPatient = Provider.of<PatientProvider>(context, listen: false)
        .emailPatient;
    String birthdayPatient = Provider.of<PatientProvider>(context, listen: false)
        .birthdayPatient;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          screenHeader(),
          SliverFillRemaining(
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    '$firstNamePatient $middleNamePatient $lastNamePatient $surNamePatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.icons8.com/material/344/user-male-circle--v1.png'),
                      radius: 50,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Fecha Nacimiento: $birthdayPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Genero: $genderPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Altura: $heightPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Peso: $weightPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Alergias: $alergiesPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Operaciones: $operationsPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Antecedentes: $recordPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Teléfono: $phonePatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Correo Electrónico: $emailPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Suscripción: $statusSuscriptionPatient',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ),
          )
        ]
      )
    );
  }
}