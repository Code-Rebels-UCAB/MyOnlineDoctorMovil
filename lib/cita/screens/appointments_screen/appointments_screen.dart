import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/cita/infraestructura/services/appointment_service.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/common/validations.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:provider/provider.dart';

import '../../infraestructura/decoradores/abstract_appointment_service.dart';
import '../../infraestructura/decoradores/log_appointmentService.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  AbstractAppointmentService appointmentService = LogAppointmentService(AppointmentService()) ;

  @override
  Widget build(BuildContext context) {
    var idPatient =
        Provider.of<IdPatientProvider>(context, listen: false).idPatient;

    return Scaffold(
      body: FutureBuilder(
          future: appointmentService.getAppointmentsOfPatient(idPatient),
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
                    ? _appointments(
                    appointmentService, snapshot.data, context)

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

  Widget _appointments(AbstractAppointmentService appointmentService,
      List<dynamic> appoinments, BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          final String idAppointment = appoinments[index]['id_cita'];
          final String statusAppointment = appoinments[index]['statuscita'];
          final String modality = appoinments[index]['modalidad'];
          final String dateAppointment =
              appoinments[index]['fechaCita'] ?? 'Por asignar';
          //final DateFormat formatter = DateFormat('dd/MM/yyyy');
          //final String dateAppointment = formatter.format(dateAppoint);
          final String hourAppointment =
              appoinments[index]['horacita'] ?? 'Por asignar';
          final dynamic durationAppointment =
              appoinments[index]['duracion'] ?? 'Por asignar';
          //final String idPatient = appoinments[index]['id_paciente'];
          //final String idDoctor = appoinments[index]['doctor']['id_doctor'];
          final String nameDoctor =
          appoinments[index]['doctor']['nombreDoctor'];
          final String genderDoctor =
          appoinments[index]['doctor']['sexoDoctor'];
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
                verifyStatusAppointment(
                    appointmentService, idAppointment, statusAppointment),
              ],
            ),
          );
        },
        childCount: appoinments.length,
      ),
    );
  }
}

Widget verifyStatusAppointment(AbstractAppointmentService appointmentService,
    String idAppointment, String status) {
  if (status == 'Solicitada') {
    return const Text(
      'Solicitada',
      style: TextStyle(
          fontSize: 16, color: Colors.amber, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Agendada') {
    return Column(
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
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 35,
                )),
          ],
        )
      ],
    );
  } else if (status == 'Aceptada') {
    return const Text(
      'Aceptada',
      style: TextStyle(
          fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Cancelada') {
    return const Text(
      'Cancelada',
      style: TextStyle(
          fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Suspendida') {
    return const Text(
      'Suspendida',
      style: TextStyle(
          fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Finalizada') {
    return const Text(
      'Finalizada',
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Iniciada') {
    return const Text(
      'Iniciada',
      style: TextStyle(
          fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Bloqueada') {
    return const Text(
      'Bloqueada',
      style: TextStyle(
          fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  return const Text(
    'Desconocido',
    style: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
  );
}