import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:myonlinedoctormovil/registro_medico/infraestructura/services/medical_record_service.dart';
import 'package:provider/provider.dart';

import '../../../common/infraestructura/authentication/auth_service.dart';
import '../../../common/infraestructura/authentication/storage/guardado_token_jwt.dart';
import 'medical_records_parts/records_list.dart';

// ignore: must_be_immutable
class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MedicalRecordsService medicalRecordsService = MedicalRecordsService(AuthService(authToken: GuardadoTokenJwt()));
    var idPatient =
        Provider.of<PatientProvider>(context, listen: false).idPatient;
    
    return Scaffold(
      body: FutureBuilder(
        future: medicalRecordsService.getPatientMedicalRecords(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CustomScrollView(
            slivers: [
              screenHeader(),
              const SliverSafeArea(
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'Registros de Historial Médico', 
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ),

               // Si el estado de la conexion esta en espera
          (snapshot.connectionState == ConnectionState.waiting)

            // Si el estado de la conexion esta en espera, genera un CircularProgressIndicator de cargo
            ? const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              )
            )

            // Si el estado de la conexion es lista
            : (snapshot.connectionState == ConnectionState.done)
              ? (snapshot.hasData)
                ? (snapshot.data.isNotEmpty)

                  // Si el estado de la conexion es lista y hay data, crea el cuerpo de la pagina
                  ? _medicalRecords(context, snapshot.data)

                  // Si el estado de la conexion es lista, hay data y esta vacia
                  : const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Data Vacia',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  )

                // Si el estado de la conexion es lista y no hay data, muestra Error
                : const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No hay coincidencias',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  )

            // Si el estado de la conexion no esta lista
            : const SliverFillRemaining(
              child: Center(
                child: Text(
                  '??',
                  style: TextStyle(fontSize: 18),
                )
              ),
            )
            ],
          );
        }
      ),
    );
  }

  // Lista de doctores
  Widget _medicalRecords(BuildContext context, List records) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RecordList(records[index])
          ),
        ),
        childCount: records.length,
      ),
    );
  }
}
