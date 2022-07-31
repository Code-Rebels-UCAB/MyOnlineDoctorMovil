import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cita/screens/appointments_screen/appointments_screen.dart';
import 'infraestructura/llamada_entrante.dart';
import 'infraestructura/notificaction_cita_suspendida.dart';
import 'infraestructura/notification_cita_agendada.dart';
import 'infraestructura/notification_llamada_entrante.dart';
import 'infraestructura/ports/abstract_notification_view.dart';


class ViewNotificacion{
  final llamadaEntrante = new NotificacionLlamadaEntrante();
  final citaAgendada = new NotificacionCitaAgendada();
  final citaSuspendida = new NotificacionCitaSuspendida();

  void ViewNotification(RemoteMessage event, BuildContext context, GlobalKey<NavigatorState> navigatorKey) {
    try {
      final splitt = event.data.values.toString().split(",");
      final title =  splitt[0].split(':')[1];
      print(title);
      if(title == 'llamada entrante'){
        llamadaEntrante.update(splitt, title, context, navigatorKey);
      }
      else if(title == 'doctor agenda cita'){
        citaAgendada.update(splitt, title, context, navigatorKey);
      }
      else if(title == 'doctor suspende cita'){
        print('aquiaqui');
        citaSuspendida.update(splitt, title, context, navigatorKey);
      }
      else if(title == 'doctor registra historia medica'){
      }
    } catch (e) {
      //catch
    }
  }


}