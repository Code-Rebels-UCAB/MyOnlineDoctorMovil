
import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/infraestructura/ports/abstract_notification_view.dart';

import 'llamada_entrante.dart';

class NotificacionLlamadaEntrante implements AbstractNotificationView<List<String>,String,BuildContext,GlobalKey<NavigatorState>> {
  @override
  void update(List<String> splitt, String contexto,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    if(contexto == 'llamada entrante'){
      viewNotification(splitt,context,navigatorKey);
    }
  }
  void viewNotification(List<String> split,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    print(split);
    final channelName = split[1].split(':')[1];
    final token = split[2].split(':')[1];
    final sexo = split[3].split(':')[1];
    final nombre = split[4].split(':')[1];
    final apellido = split[5].split(':')[1];
    final idDoctor = split[6].split(':')[1];
    final foto = split[7].split(')')[0];
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => IncomingCall(
        idDoctor: idDoctor.trim(),
        nombre: nombre.trim(),
        apellido: apellido.trim(),
        sexo: sexo.trim(),
        image: foto.trim(),
        channelName: channelName.trim(),
        token: token.trim(),
      ),
    ));
  }
}