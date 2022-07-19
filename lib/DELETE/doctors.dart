Future<List<Map>> futureDoctorTask(dynamic searchBar, dynamic dropdown) async {
  await Future.delayed(const Duration(seconds: 2));
  if (searchBar == ' ') {
    return doctorsf;
  } else if (searchBar == 'h') {
    if (dropdown == 'Nombre y Apellido') {
      return doctorsna;
    } else if (dropdown == 'Especialidad') {
      return doctorse;
    }
  }
  return doctorsf;
}

List<Map> doctorsf = [
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 0.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 1.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 2.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 3.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 4.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'id',
    'nombre': 'name',
    'sexo': 'gender',
    'correo': 'mail',
    'especialidades': ['specialty'],
    'calificacion': 5.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
];

List<Map> doctorse = [
 {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty0'],
    'calificacion': 0.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty1'],
    'calificacion': 1.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty2'],
    'calificacion': 2.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty3'],
    'calificacion': 3.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty4'],
    'calificacion': 4.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'specialty',
    'nombre': 'specialty',
    'sexo': 'specialty',
    'correo': 'specialty',
    'especialidades': ['specialty', 'specialty5'],
    'calificacion': 5.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
];

List<Map> doctorsna = [
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname0'],
    'calificacion': 0.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname1'],
    'calificacion': 1.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname2'],
    'calificacion': 2.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname3'],
    'calificacion': 3.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname4'],
    'calificacion': 4.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
  {
    'id_doctor': 'name and lastname',
    'nombre': 'name and lastname',
    'sexo': 'name and lastname',
    'correo': 'name and lastname',
    'especialidades': ['name and lastname', 'name and lastname5'],
    'calificacion': 5.0,
    'photo':
        'https://drive.google.com/uc?export=view&id=1PvAN-EexVE_jiHRTg7kHJKb8HXUKSxyc',
  },
];
