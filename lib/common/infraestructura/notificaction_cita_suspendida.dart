
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myonlinedoctormovil/common/infraestructura/ports/abstract_notification_view.dart';

import 'llamada_entrante.dart';

class NotificacionCitaSuspendida implements  AbstractNotificationView<List<String>,String,BuildContext,GlobalKey<NavigatorState>> {
  @override
  void update(List<String> splitt, String contexto,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    print('aquiaqui2');
    if(contexto == 'doctor suspende cita'){
      print('aquiaqui3');
      viewNotification(splitt,context,navigatorKey);
    }
  }
  void viewNotification(List<String> split,BuildContext context,GlobalKey<NavigatorState> navigatorKey){
    print('aquiaqui4');
    Fluttertoast.showToast(
      msg: "Cita suspendida",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 15,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
    );
  }
}