import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myonlinedoctormovil/common/infraestructura/ports/abstract_notification_view.dart';

import 'llamada_entrante.dart';

class NotificacionRegistroCreado implements  AbstractNotificationView<List<String>,String,BuildContext,GlobalKey<NavigatorState>> {
  @override
  void update(List<String> splitt, String contexto,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    if(contexto == 'doctor registra historia medica'){
      viewNotification(splitt,context,navigatorKey);
    }
  }
  void viewNotification(List<String> split,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    Fluttertoast.showToast(
      msg: "Registro medico creado",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 15,
      backgroundColor: Colors.orangeAccent,
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
    );
  }
}