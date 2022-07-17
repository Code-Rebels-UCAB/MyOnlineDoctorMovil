import 'package:flutter/material.dart';

import '../../models/Cita.dart';
import '../NavBar.dart';
import '../../JsonDataExample/data.dart';

class citasLista extends StatelessWidget {
  late List<Cita> citas = dataSimulator.getCitas();
  late int citapage;

  citasLista({Key? key, required this.citapage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyOnlineDoctor'),
        backgroundColor: const Color(0xFF00B0E8),
      ),
      body: Container(
        child: buildCitas(citas, DateTime.now()),
      ),
    );
  }

  Widget buildCitas(List<Cita> citas, DateTime fechaHoy) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "Citas del dia de Hoy:      ${fechaHoy.year} / ${fechaHoy.month} / ${fechaHoy.day}",
                  style: const TextStyle(fontSize: 28)),
            )),
        Expanded(
            child: ListView.builder(
          itemCount: citas.length,
          itemBuilder: (context, index) {
            final cita = citas[index];
            return Card(
                child: Container(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300.0,
                    child: Title(
                        color: Colors.black,
                        child: Text(
                          cita.Paciente,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Title(
                        color: Colors.black,
                        child: Text(
                          cita.Hour,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Title(
                        color: Colors.black,
                        child: Text(
                          cita.Modalidad,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Title(
                        color: Colors.black,
                        child: Text(
                          cita.Status,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ),
                  if (citas[index].Status == "Aceptada" &&) _mostrarBotones(),
                  if (citas[index].Status == "Aceptada" &&) _mostrarBotones()
                ],
              ),
            ));
          },
        ))
      ],
    );
  }

  Widget _mostrarBotones0() {
    return Row(
      children: [
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 15, 214, 18),
              ),
              child: const Text(
                'Llamar',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {}),
        ),
        const SizedBox(
          width: 50.0,
        ),
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF0000),
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {}),
        )
      ],
    );
  }

  Widget _mostrarBotones1() {
    return Row(
      children: [
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 15, 214, 18),
              ),
              child: const Text(
                'Llamar',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
