import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';

import 'register_parts/alergies_field.dart';
import 'register_parts/birthday_field.dart';
import 'register_parts/email_field.dart';
import 'register_parts/firstName_field.dart';
import 'register_parts/gender_dropdown.dart';
import 'register_parts/height_field.dart';
import 'register_parts/lastName_field.dart';
import 'register_parts/middleName_field.dart';
import 'register_parts/operation_field.dart';
import 'register_parts/password_field.dart';
import 'register_parts/phone_field.dart';
import 'register_parts/record_field.dart';
import 'register_parts/register_button.dart';
import 'register_parts/surName_field.dart';
import 'register_parts/weight_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          //future: ,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return CustomScrollView(
          slivers: [
            screenHeader(),
            const SliverToBoxAdapter(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Registro Paciente',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2,
                children: const [
                  // Primer Nombre
                  FirstNamePatientRegistration(),

                  // Segundo Nombre
                  MiddleNamePatientRegistration(),

                  // Primer Apellido
                  LastNamePatientRegistration(),

                  // Segundo Apellido
                  SurNamePatientRegistration(),

                  // Genero
                  GenderPatientRegistration(),

                  // Fecha de Nacimiento
                  BirthdayPatientRegistration(),

                  // Altura
                  HeightPatientRegistration(),

                  // Peso
                  WeightPatientRegistration(),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    const SizedBox(
                      height: 10,
                    ),

                    // Telefono
                    const PhonePatientRegistration(),
                    const SizedBox(height: 15,),

                     // Correo Electronico
                    const EmailPatientRegistration(),
                    const SizedBox(height: 15,),

                    // Contraseña
                    const PasswordPatientRegistration(),
                    const SizedBox(height: 15,),

                    // Antecedentes
                    const RecordPatientRegistration(),
                    const SizedBox(height: 15,),

                    // Operaciones
                    const OperationsPatientRegistration(),
                    const SizedBox(height: 15,),

                    // Alergias
                    const AlergiesPatientRegistration(),
                    const SizedBox(height: 20,),

                    const Text(
                      '* Campos Obligatorios',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 20,),

                    const RegisterButtonPatient(),
                    const SizedBox(height: 20,),
                  ]
                )
              ),
            )
          ],
        );
      }),
    );
  }
}
