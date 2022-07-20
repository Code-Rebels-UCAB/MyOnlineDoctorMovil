Future<List<Map>> futurePatientTask(dynamic idPatient) async {
  await Future.delayed(const Duration(seconds: 2));
  return patient;
}

List<Map> patient = [
  {
    'name': 'Rory Gilmore',
  },
];
