import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'llamada.dart';

class IncomingCall extends StatefulWidget {
  final String image;
  const IncomingCall({Key? key, required this.image}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
                      Text('Dr Nombre', style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),),
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
                            Navigator.of(context).pop();
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
                            FlutterRingtonePlayer.stop();
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CallPage(
                                    channelName: 'channel',
                                    role: ClientRole.Broadcaster,
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