abstract class AbstractDoctorService {
  Future<List<dynamic>> getDoctors(String dropdownFilter, String searchValue);
  Future postRatingDoctor(String idDoctor, String idPatient, dynamic raiting);

}