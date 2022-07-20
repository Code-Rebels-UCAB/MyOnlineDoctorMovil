import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/DELETE/patient.dart';
import 'package:myonlinedoctormovil/cita/screens/appointments_screen/appointments_screen.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/search_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);
  static const String routeName = '/mainmenu';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const MainMenuScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  dynamic idPatient = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainMenu());
  }

  Widget mainMenu() {
    return FutureBuilder(
        future: futurePatientTask(idPatient),///////////////////////////////////////////////////////
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CustomScrollView(
            slivers: [
              screenHeader(),

              (snapshot.connectionState == ConnectionState.waiting)
                  ? const SliverFillRemaining(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : (snapshot.connectionState == ConnectionState.done)
                      ? (snapshot.hasData)
                          ? _mainMenuBody(context, snapshot.data)
                          : const SliverFillRemaining(
                              child: Center(
                              child: Text(
                                'Error',
                                style: TextStyle(fontSize: 18),
                              ),
                            ))
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
    String name = patient[0]['name'];

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 10, left: 8, right: 8),
            child: Text(
              '¡Bienvenido $name!', //Aqui agregar el nombre del paciente
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://drive.google.com/uc?export=view&id=1j9q4f-fjoi5Gyc-WJRj5v4NMiU7KjOLj'
              ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen()
                  )
                );
              },
              child: const Text(
                'Buscar Doctores',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  //fontWeight: FontWeight.normal
                ),
              )
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SearchScreen() //Cambiar ruta aqui
                  )
                );
              },
              child: const Text(
                'Ver Historia Medica',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const AppointmentsScreen() //Cambiar ruta aqui
                  )
                );
              },
              child: const Text(
                'Ver Listado de Citas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SearchScreen() //Cambiar ruta aqui
                  )
                );
              },
              child: const Text(
                'Información Personal',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SearchScreen() //Cambiar ruta aqui
                  )
                );
              },
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
