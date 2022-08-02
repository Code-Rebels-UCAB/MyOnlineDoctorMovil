import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/empty_textfield_warning.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        //future: ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return CustomScrollView(
          slivers: [
            screenHeader(),
            SliverSafeArea(
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.icons8.com/material/344/user-male-circle--v1.png'),
                        radius: 50,
                      ),
                    ),
                    const Spacer(),
                    // FieldText Correo Electrónico
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Correo Electrónico',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          height: 50,
                          width: 300,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue, width: 1)),
                          child: TextFormField(
                            controller: _email,
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // FieldText Contraseña
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contraseña',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          height: 50,
                          width: 300,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue, width: 1)),
                          child: TextFormField(
                            controller: _password,
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Button de Inicio de Sesion
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: Colors.blue,
                            side:
                                const BorderSide(width: 1.0, color: Colors.blue),
                            fixedSize: const Size(200, 40),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_email.text.isNotEmpty &&
                                _password.text.isNotEmpty) {
                                //Navigator.of(context).pushNamed('/search');//////////////////////////////////
                              } else if (_email.text.isEmpty || _password.text.isEmpty) {
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
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    const Spacer(),
                    const Text(
                      '¿No tienes cuenta?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      child: const Text('Regístrate'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        ///////////////////////////////////////////////////
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
