import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/registro_medico/providers/medical_record_provider.dart';
import 'package:provider/provider.dart';

import 'medical_record_info_dialog.dart';
import 'recods_item.dart';

// ignore: must_be_immutable
class RecordList extends StatelessWidget {
  Map item;
  RecordList(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Se agrega la lista de Widgets, cada uno con la informacion de un doctor
        child: RecordItem(item['nombreDoctor'], item['sexoDoctor'], item['modalidad'],  item['fechaCita'],),
        // Al hacer click sobre el doctor se abre una ventana para Solicitar Cita
        onTap: () {
          Provider.of<MedicalRecordProvider>(context, listen: false).setMedicalRecord(item);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MedicalRecordInfoDialog();
            },
          );
        });
  }
}
