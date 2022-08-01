import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/empty_textfield_warning.dart';
import 'package:myonlinedoctormovil/paciente/screens/register_screen/register_parts/registration_values.dart';

class RegisterButtonPatient extends StatefulWidget {
  const RegisterButtonPatient({Key? key}) : super(key: key);

  @override
  State<RegisterButtonPatient> createState() => _RegisterButtonPatientState();
}

class _RegisterButtonPatientState extends State<RegisterButtonPatient> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          backgroundColor: Colors.blue,
                          side: const BorderSide(width: 1.0, color: Colors.blue),
                          fixedSize: const Size(200, 40),
                        ),
                        onPressed: () {
                          setState(() {
                            if (RegistrationValues.firstName.text.isNotEmpty && RegistrationValues.lastName.text.isNotEmpty && RegistrationValues.surName.text.isNotEmpty && RegistrationValues.dropdownSelectedGenderItem != ' ' && RegistrationValues.birthday.text.isNotEmpty && RegistrationValues.height.text.isNotEmpty && RegistrationValues.weight.text.isNotEmpty && RegistrationValues.phone.text.isNotEmpty && RegistrationValues.email.text.isNotEmpty && RegistrationValues.password.text.isNotEmpty && RegistrationValues.record.text.isNotEmpty ) {
                              //Navigator.of(context).pushNamed('/search');//////////////////////////////////
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const EmptyTextFiledWarning ();
                                },
                              );
                            }
                          });
                        },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ),
                    );
  }
}
