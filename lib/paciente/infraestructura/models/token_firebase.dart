class TokenFirebase{
    final String idPaciente;
    final String tokenF;

    const TokenFirebase({
      required this.idPaciente,
      required this.tokenF,

    });

    factory TokenFirebase.fromJson(Map<String, dynamic> json){
      return TokenFirebase(
          idPaciente: json['idPaciente'],
          tokenF: json['tokenF'],
      );
    }









}

