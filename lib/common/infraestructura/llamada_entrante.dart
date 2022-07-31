import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../paciente/screens/main_menu_screen.dart';
import '../validations.dart';
import 'llamada.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class IncomingCall extends StatefulWidget {
  final String idDoctor;
  final String nombre;
  final String apellido;
  final String sexo;
  final String image;
  final String token;
  final String channelName;

  IncomingCall({Key? key, required this.idDoctor, required this.nombre, required this.apellido, required this.sexo, required this.image, required this.token, required this.channelName}) : super(key: key);

  @override
  State<IncomingCall> createState() => _IncomingCallState();
}

class _IncomingCallState extends State<IncomingCall> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterRingtonePlayer.play(
      android: AndroidSounds.alarm,
      ios: IosSounds.glass,
      looping: true, // Android only - API >= 28
      volume: 1, // Android only - API >= 28
      asAlarm: false, // Android only - all APIs
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }

  @override
  Widget build(BuildContext context) {
    final gender = verifyGender(widget.sexo);
    final nombreDoctor = '${gender} ${widget.nombre} ${widget.apellido}';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:
          LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Color.fromRGBO(94,252,232,1), Color.fromRGBO(115,110,254,1)]),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(75.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 70,
                          child: Image.network(
                            widget.image,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return  CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 70,
                              );
                            } ,
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(' '),
                      Text(' '),
                      Text('${nombreDoctor}', style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),),
                      Text(' '),
                      Text('Cita entrante', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ) ,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: RawMaterialButton(
                          onPressed: () {

                            FlutterRingtonePlayer.stop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainMenuScreen()
                              ),
                            );
                            FirebaseAnalytics.instance.logEvent(name: 'rechazo_videollamada', parameters: {'event_name':'rechazo_videollamada'});
                            print('Log: El paciente rechazo la videollamada');
                          },
                          child: const Icon(
                            Icons.call_end,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          shape: const CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.redAccent,
                          padding: const EdgeInsets.all(15.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: RawMaterialButton(
                          onPressed: () async {
                            FirebaseAnalytics.instance.logEvent(name: 'acepto_videollamada', parameters: {'event_name':'acepto_videollamada'});
                            print('Log: El paciente acepto la videollamada');
                            await _handleCameraAndMic(Permission.camera);
                            await _handleCameraAndMic(Permission.microphone);
                            FlutterRingtonePlayer.stop();
                            await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CallPage(
                                    idDoctor: widget.idDoctor,
                                    nombre: widget.nombre,
                                    apellido: widget.apellido,
                                    sexo: widget.sexo,
                                    channelName: widget.channelName,
                                    role: ClientRole.Broadcaster,
                                    token: widget.token,
                                  ),
                                ));
                          },
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          shape: const CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.green,
                          padding: const EdgeInsets.all(15.0),
                        ),
                      )
                    ],
                  ))
            ]),
      ),
    );
  }
}