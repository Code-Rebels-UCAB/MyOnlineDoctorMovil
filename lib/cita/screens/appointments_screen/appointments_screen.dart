import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/cita/infraestructura/services/appointment_service.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/common/validations.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:provider/provider.dart';

import '../../infraestructura/decorators/log_appointmentService.dart';
import '../../infraestructura/puertos/abstract_appointment_service.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  AbstractAppointmentService appointmentService =
      LogAppointmentService(AppointmentService());

  @override
  Widget build(BuildContext context) {
    var idPatient =
        Provider.of<IdPatientProvider>(context, listen: false).idPatient;

    var _futureAppoinments =
        appointmentService.getAppointmentsOfPatient(idPatient);

    void updateData() {
      setState(() {
        _futureAppoinments = appointmentService.getAppointmentsOfPatient(idPatient);
      });
    }

    return Scaffold(
      body: FutureBuilder(
          future: _futureAppoinments,
          //futureAppoTask(3),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return CustomScrollView(
              slivers: [
                screenHeader(),
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 10, left: 8, right: 8),
                      child: Text('Listado de Citas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                    ),
                  ),
                ),

                // Si el estado de la conexion esta en espera
                (snapshot.connectionState == ConnectionState.waiting)

                    // Si el estado de la conexion esta en espera, genera un CircularProgressIndicator de cargo
                    ? const SliverFillRemaining(
                        child: Center(
                        child: CircularProgressIndicator(),
                      ))

                    // Si el estado de la conexion es lista
                    : (snapshot.connectionState == ConnectionState.done)
                        ? (snapshot.hasData)
                            ? (snapshot.data.isNotEmpty)

                                // Si el estado de la conexion es lista y hay data, crea el cuerpo de la pagina
                                ? SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      final String idAppointment = snapshot.data[index]['id_cita'];
                                      final String statusAppointment = snapshot.data[index]['statuscita'];
                                      final String modality = snapshot.data[index]['modalidad'];
                                      final String dateAppointment =
                                          snapshot.data[index]['fechaCita'] ?? 'Por asignar';
                                      final String hourAppointment =
                                          snapshot.data[index]['horacita'] ?? 'Por asignar';
                                      final dynamic durationAppointment =
                                          snapshot.data[index]['duracion'] ?? 'Por asignar';
                                      final String nameDoctor =
                                          snapshot.data[index]['doctor']['nombreDoctor'];
                                      final String genderDoctor =
                                          snapshot.data[index]['doctor']['sexoDoctor'];
                                      return Card(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    // Nombre del Doctor
                                                    Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(
                                                            '${verifyGender(genderDoctor)} $nameDoctor',
                                                            style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14.0))),
                                                    // Modalidad de la cita
                                                    Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(modality,
                                                            style: const TextStyle(fontSize: 14.0))),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    // Dia de la cita
                                                    Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text('Dia: $dateAppointment',
                                                            style: const TextStyle(fontSize: 14.0))),
                                                    // Hora de la cita
                                                    Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text('Hora: $hourAppointment',
                                                            style: const TextStyle(fontSize: 14.0))),
                                                  ],
                                                ),
                                                // Duracion de la cita
                                                Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Text('Duración: $durationAppointment',
                                                        style: const TextStyle(fontSize: 14.0))),
                                              ],
                                            ),
                                            const Spacer(),
                                            if (statusAppointment == 'Solicitada') 
                                              const Text(
                                                'Solicitada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.amber, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Agendada') 
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const Text(
                                                    'Agendada',
                                                    style: TextStyle(
                                                        fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                                                  ),
                                                  //SizedBox()
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            // Enviar estado y cargar futuro de citas
                                                            appointmentService.postAcceptDeclineAppointment(
                                                                idAppointment, 'Aceptada');
                                                            updateData();
                                                          },
                                                          icon: const Icon(
                                                            Icons.check_circle_outline_rounded,
                                                            color: Colors.green,
                                                            size: 35,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {
                                                            // Enviar estado y cargar futuro de citas
                                                            appointmentService.postAcceptDeclineAppointment(
                                                                idAppointment, 'Cancelada');
                                                            updateData();
                                                          },
                                                          icon: const Icon(
                                                            Icons.cancel_outlined,
                                                            color: Colors.red,
                                                            size: 35,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              )
                                            else if (statusAppointment == 'Aceptada') 
                                              const Text(
                                                'Aceptada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Cancelada')
                                              const Text(
                                                'Cancelada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Suspendida')
                                              const Text(
                                                'Suspendida',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Finalizada')
                                              const Text(
                                                'Finalizada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Iniciada')
                                              const Text(
                                                'Iniciada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                                              )
                                            else if (statusAppointment == 'Bloqueada')
                                              const Text(
                                                'Bloqueada',
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                                              )
                                          ],
                                        ),
                                      );
                                    },
                                    childCount: snapshot.data.length,
                                  ),
                                )

                                // Si el estado de la conexion es lista, hay data y esta vacia
                                : const SliverFillRemaining(
                                    child: Center(
                                    child: Text(
                                      'No hay Data',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ))

                            // Si el estado de la conexion es lista y no hay data, muestra Error
                            : const SliverFillRemaining(
                                child: Center(
                                child: Text(
                                  'Aun no tiene citas',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ))

                        // Si el estado de la conexion no esta lista
                        : const SliverFillRemaining(
                            child: Center(
                                child: Text(
                              '??',
                              style: TextStyle(fontSize: 18),
                            )),
                          )
              ],
            );
          }),
    );
  }

}
