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
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _surName = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _record = TextEditingController();
  final TextEditingController _operations = TextEditingController();
  final TextEditingController _alergies = TextEditingController();

  final dynamic _dropdownSelectedGenderItem = ' ';
  bool _hidePassword = true;

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
                children: [
                  // Primer Nombre
                  FirstNamePatientRegistration(_firstName),

                  // Segundo Nombre
                  MiddleNamePatientRegistration(_middleName),

                  // Primer Apellido
                  LastNamePatientRegistration(_lastName),

                  // Segundo Apellido
                  SurNamePatientRegistration(_surName),

                  // Genero
                  GenderPatientRegistration(_dropdownSelectedGenderItem),

                  // Fecha de Nacimiento
                  BirthdayPatientRegistration(_birthday),

                  // Altura
                  HeightPatientRegistration(_height),

                  // Peso
                  WeightPatientRegistration(_weight),
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
                    PhonePatientRegistration(_phone),
                    const SizedBox(height: 15,),

                     // Correo Electronico
                    EmailPatientRegistration(_email),
                    const SizedBox(height: 15,),

                    // Contraseña
                    PasswordPatientRegistration(_password, _hidePassword),
                    const SizedBox(height: 15,),

                    // Antecedentes
                    RecordPatientRegistration(_record),
                    const SizedBox(height: 15,),

                    // Operaciones
                    OperationsPatientRegistration(_operations),
                    const SizedBox(height: 15,),

                    // Alergias
                    AlergiesPatientRegistration(_alergies),
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

                    RegisterButtonPatient(_firstName, _middleName, _lastName, _surName, _birthday, _height, _weight, _phone, _email, _password, _record, _operations, _alergies, _dropdownSelectedGenderItem),
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
