import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/common/screen_header.dart';
import 'package:myonlinedoctormovil/doctor/infraestructura/decorators/log_doctors_service.dart';
import 'package:myonlinedoctormovil/doctor/infraestructura/models/abstract_doctor_service.dart';
import 'package:myonlinedoctormovil/doctor/infraestructura/services/doctor_service.dart';
import 'package:myonlinedoctormovil/doctor/screens/search_doctor_screen/screen_parts/doctors_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  AbstractDoctorService doctorService = LogDoctorsService(DoctorService());
  // ignore: prefer_final_fields
  TextEditingController _textFieldFilter = TextEditingController();
  dynamic _dropdownSelectedFilterItem = ' ';
  dynamic dropdownFlag = 0;
  dynamic _searchBarEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // FutureBuilder para la carga de doctores
        body: FutureBuilder(
      // Para obtener el futuro de uns busqueda, enviamos el filtro y el valor que desea el usuario de ese filtro
      future: doctorService.getDoctors(_dropdownSelectedFilterItem, 
          _textFieldFilter.text),
      //futureDoctorTask(_textFieldFilter.text, _dropdownSelectedFilterItem),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return CustomScrollView(slivers: [
          // Header de la applicacion
          screenHeader(),

          // Dropdown Button y Barra de Busqueda (TextField) para la busqueda
          SliverToBoxAdapter(
              child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'Filtrar por: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                  // Dropdown Button
                  child: _filterDropdown(context))
            ]),
            // Barra de Busqueda (TextField)
            _searchBar(context),
          ])),

          // Si el estado de la conexion esta en espera
          (snapshot.connectionState == ConnectionState.waiting)

            // Si el estado de la conexion esta en espera, genera un CircularProgressIndicator de cargo
            ? const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              )
            )

            // Si el estado de la conexion es lista
            : (snapshot.connectionState == ConnectionState.done)
              ? (snapshot.hasData)
                ? (snapshot.data.isNotEmpty)

                  // Si el estado de la conexion es lista y hay data, crea el cuerpo de la pagina
                  ? _doctorList(context, snapshot.data)

                  // Si el estado de la conexion es lista, hay data y esta vacia
                  : const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Data Vacia',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  )

                // Si el estado de la conexion es lista y no hay data, muestra Error
                : const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No hay coincidencias',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  )

            // Si el estado de la conexion no esta lista
            : const SliverFillRemaining(
              child: Center(
                child: Text(
                  '??',
                  style: TextStyle(fontSize: 18),
                )
              ),
            )
        ]);
      },
    ));
  }

  // Dropdown Button para la seleccion de filtro
  Widget _filterDropdown(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 1)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('Select'),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.blue,
          ),

          // Valor actual del Dropdown Button
          value: _dropdownSelectedFilterItem,

          // Valores para el filtro
          items: <String>[
            ' ',
            'Nombre y Apellido',
            'Especialidad',
            'Top Doctores',
            //'Geolocalización'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          underline: const SizedBox(
            height: 0,
          ),

          // Cuando cambie el estado del Dropdown Button: asigna el nuevo valor, y habilita o deshabilita el TextField de busqueda
          onChanged: (newValue) {
            setState(() {
              _dropdownSelectedFilterItem = newValue;
              if (_dropdownSelectedFilterItem == ' ') {
                _searchBarEnable = false;
              } else if (_dropdownSelectedFilterItem == 'Top Doctores'){
                _searchBarEnable = false;
                doctorService.getDoctors(
                _dropdownSelectedFilterItem, _textFieldFilter.text);
              } else {
                _searchBarEnable = true;
              } 
            });
          },
        ),
      ),
    );
  }

  // TextField para la busqueda
  Widget _searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 1)),
      width: double.infinity,
      height: 45,
      child: TextField(
        controller: _textFieldFilter,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Buscar',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            suffixIcon:
                /////////////////////////////////////////////////////////////////FILTRO GEOGRAFICO
                //IconButton(icon: Icon(Icons.location_on_sharp), color: Colors.blue, onPressed: () {}),
                Icon(
              Icons.location_on_sharp,
              color: Colors.blue,
            )),

        // Propiedad que habilita/deshabilita el TextField
        enabled: _searchBarEnable,

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////VUELVE AQUI
        onTap: () {
          if (_dropdownSelectedFilterItem == ' ') {
            // alert
          }
        },

        // Cuando se de un cambio de estado en el TextField, reconstruye
        onChanged: (text) {
          setState(() {
            doctorService.getDoctors(
                _dropdownSelectedFilterItem, _textFieldFilter.text);
            //futureDoctorTask(text, _dropdownSelectedFilterItem);
          });
        },
      ),
    );
  }

  // Lista de doctores
  Widget _doctorList(BuildContext context, List doctorsfuture) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DoctorList(doctorsfuture[index])
          ),
        ),
        childCount: doctorsfuture.length,
      ),
    );
  }
}
