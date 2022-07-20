import 'package:flutter/material.dart';

class RateDoctor extends StatefulWidget {
  const RateDoctor({Key? key}) : super(key: key);

  @override
  State<RateDoctor> createState() => _RateDoctorState();
}

class _RateDoctorState extends State<RateDoctor> {
  // Booleanos que manejan el cambio de apariencia de las estrellas de calificacion
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  // Ventana Dialog para calificar cita
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '¿Cómo fue su experiencia con Dr. o Dra. Nombre Apellido?', // Agregar nombre y genero
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        overflow: TextOverflow.visible
      ),
      content: SingleChildScrollView(
        child: Row(
          children: [
            IconButton(
              icon: star1
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star1) {
                    star1 = true;
                    star2 = false;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  } else {
                    star2 = false;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star2
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star2) {
                    star1 = true;
                    star2 = true;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  } else {
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star3
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star3) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = false;
                    star5 = false;
                  } else {
                    star4 = false;
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star4
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star4) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = false;
                  } else {
                    star5 = false;
                  }
                });
              }
            ),
            IconButton(
              icon: star5
              ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
              : const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (!star5) {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = true;
                  }
                });
              }
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Enviar Calificarción'),
          onPressed: () {
            // Enviar Calificacion
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
