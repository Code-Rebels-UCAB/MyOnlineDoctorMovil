import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/DELETE/appointments.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);
  static const String routeName = '/appointments';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const AppointmentsScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureAppoTask(3),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CustomScrollView(
            slivers: [
              screenHeader(),
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 10, left: 8, right: 8),
                    child: Text('Listado de Citas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                  ),
                ),
              ),
              (snapshot.connectionState == ConnectionState.waiting)
                ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  )
                )
                : (snapshot.connectionState == ConnectionState.done)
                  ? (snapshot.hasData)
                    ? _appointments(snapshot.data, context)
                    : const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Error',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    )
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

  Widget _appointments(List appoinments, BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                verifyGender(
                                    appoinments[index]['name'], appoinments[index]['name']),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14.0))),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(appoinments[index]['modality'],
                                style: const TextStyle(fontSize: 14.0))),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(appoinments[index]['date'],
                                style: const TextStyle(fontSize: 14.0))),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(appoinments[index]['hour'],
                                style: const TextStyle(fontSize: 14.0))),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(appoinments[index]['duration'],
                            style: const TextStyle(fontSize: 14.0))),
                  ],
                ),
                const Spacer(),
                verifyStatusAppointment(appoinments[index]['status']),
              ],
            ),
          );
        },
        childCount: appoinments.length,
      ),
    );
  }
}

String verifyGender(String gender, String name) {
  if (gender == 'f') {
    return "Dra. $name";
  } else {
    return "Dr. $name";
  }
}

Widget verifyStatusAppointment(String status) {
  if (status == 'Solicitada') {
    return const Text(
      'Solicitada',
      style: TextStyle(fontSize: 16, color: Colors.amber, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Agendada') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Agendada',
          style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        //SizedBox()
        Row(
          children: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.check_circle_outline_rounded, 
                color: Colors.green,
                size: 35,
              )
            ),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.cancel_outlined, 
                color: Colors.red,
                size: 35,
              )
            ),
          ],
        )
      ],
    );
  } else if (status == 'Aceptada') {
    return const Text(
      'Aceptada',
      style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Cancelada') {
    return const Text(
      'Cancelada',
      style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Suspendida') {
    return const Text(
      'Suspendida',
      style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Finalizada') {
    return const Text(
      'Finalizada',
      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Iniciada') {
    return const Text(
      'Iniciada',
      style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  } else if (status == 'Bloqueada') {
    return const Text(
      'Bloqueada',
      style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  return const Text(
    'Desconocido',
    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
