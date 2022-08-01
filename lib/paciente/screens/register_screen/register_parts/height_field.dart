import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeightPatientRegistration extends StatelessWidget {

  TextEditingController _height = TextEditingController();

  HeightPatientRegistration(this._height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Altura (cm)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 1)
          ),
          child: TextFormField(
            controller: _height,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: '00',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 10
              ),
            ),
          ),
        ),
      ],
    );
  }
}