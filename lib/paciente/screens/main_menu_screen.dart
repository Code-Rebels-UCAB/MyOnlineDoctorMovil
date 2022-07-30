import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/paciente/infraestructura/services/patient_services.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:provider/provider.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);
  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  PatientService patientService = PatientService();
  dynamic idPatient = '649edad6-0795-4126-9398-f1728b7ef318';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainMenu());
  }

  Widget mainMenu() {
    return FutureBuilder<dynamic>(
        future: patientService.getPatient(idPatient),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CustomScrollView(
            slivers: [
              screenHeader(),

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
                              ? _mainMenuBody(context, snapshot.data)

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
                                'Error',
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
        });
  }

  Widget _mainMenuBody(BuildContext context, patient) {
    String idPatient = patient['id_paciente'];
    Provider.of<IdPatientProvider>(context, listen: false)
        .setIdPatient(idPatient);
    String name = patient['p_nombre'];
    String lastName = patient['p_apellido'];
    //String photo = patient['fofo'];

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 10, left: 8, right: 8),
            child: Text(
              '¡Bienvenido $name $lastName!', //Aqui agregar el nombre del paciente
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.icons8.com/material/344/user-male-circle--v1.png'),
              radius: 50,
            ),
          ),

          // Button de Buscar Doctores
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: const Text(
                  'Buscar Doctores',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    //fontWeight: FontWeight.normal
                  ),
                )),
          ),

          // Button de Ver Historia Medica
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: const Text(
                  'Ver Historia Medica',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ),

          // Button de Ver Listado de Citas
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/appointments');
                },
                child: const Text(
                  'Ver Listado de Citas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ),

          // Button de Informacion Personal
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: const Text(
                  'Información Personal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ),

          // Button de Cerrar Sesión
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  side: const BorderSide(width: 1.0, color: Colors.red),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
