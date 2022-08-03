import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/empty_textfield_warning.dart';
import 'package:myonlinedoctormovil/common/infraestructura/authentication/ports/auth_service_abstract.dart';
import 'package:myonlinedoctormovil/common/infraestructura/validaciones.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/paciente/screens/register_screen/register_screen.dart';
import 'package:provider/provider.dart';

import '../../common/infraestructura/authentication/auth_service.dart';
import '../../common/infraestructura/authentication/storage/guardado_token_jwt.dart';
import '../../common/infraestructura/push_notificaciones_servicio.dart';
import '../infraestructura/models/iniciar_sesion_paciente.dart';
import '../infraestructura/models/token_firebase.dart';
import '../infraestructura/puertos/token_paciente_request_abstract.dart';
import '../infraestructura/services/enviar_token_paciente.dart';
import '../providers/iniciar_sesion_estado.dart';
import 'main_menu_screen.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  //final TokenPacienteRequestAbstract tokenPacienteRequestAbstract = TokenPacienteRequestAbstract();
  bool _isLoading = false;


  void login() async {
    setState((){
      _isLoading = true;
    });
    final credenciales = IniciarSesionPacienteModelo(correoPaciente:_email.text, passwordPaciente:_password.text);
    try {
      await Provider.of<IniciarSesionEstado>(context,  listen: false).iniciarSesion(credenciales);

      String token = await PushNotificationService.initializeApp();
      TokenFirebase tokenFirebase = TokenFirebase(tokenF: token);
      EnviarTokenPaciente tokenRequest = EnviarTokenPaciente(AuthService(authToken: GuardadoTokenJwt()));
      final response =  tokenRequest.guardarToken(tokenFirebase);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MainMenuScreen()
        ),
      );
    }catch(e){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const EmptyTextFiledWarning (message:"Revise sus credenciales");
        },
      );
    } finally {
      setState((){
        _isLoading = false;
      });
    }
  }

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
                            obscureText: true,
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
                      child: _isLoading ? const CircularProgressIndicator() : OutlinedButton(
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
                            if(!Validaciones.validarCorreo(_email.text)){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const EmptyTextFiledWarning (message:"Correo Invalido");
                                },
                              );
                            }
                            if(!Validaciones.validarContrasena(_password.text)){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const EmptyTextFiledWarning (message:"La contraseña debe tener al menos 8 caracteres y una mayuscula");
                                },
                              );
                            }
                            login();
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
