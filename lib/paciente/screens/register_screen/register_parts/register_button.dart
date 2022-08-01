import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/empty_textfield_warning.dart';

// ignore: must_be_immutable
class RegisterButtonPatient extends StatelessWidget {

  TextEditingController _firstName = TextEditingController();
  TextEditingController _middleName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _surName = TextEditingController();
  TextEditingController _birthday = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _record = TextEditingController();
  TextEditingController _operations = TextEditingController();
  TextEditingController _alergies = TextEditingController();

  dynamic _dropdownSelectedGenderItem = ' ';

  RegisterButtonPatient(
    this._firstName, this._middleName, this._lastName, this._surName, this._birthday, this._height, this._weight, this._phone, this._email, this._password, this._record, this._operations, this._alergies, this._dropdownSelectedGenderItem, {Key? key}) : super(key: key);

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
          if (_firstName.text.isNotEmpty && _lastName.text.isNotEmpty && _surName.text.isNotEmpty && _dropdownSelectedGenderItem != ' ' && _birthday.text.isNotEmpty && _height.text.isNotEmpty && _weight.text.isNotEmpty && _phone.text.isNotEmpty && _email.text.isNotEmpty && _password.text.isNotEmpty && _record.text.isNotEmpty ) {
            //Navigator.of(context).pushNamed('/search');//////////////////////////////////
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const EmptyTextFiledWarning ();
              },
            );
          }
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