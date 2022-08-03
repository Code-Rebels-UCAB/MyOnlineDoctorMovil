class TokenFirebase{
    final String tokenF;

    const TokenFirebase({
      required this.tokenF,

    });

    factory TokenFirebase.fromJson(Map<String, dynamic> json){
      return TokenFirebase(
          tokenF: json['tokenF'],
      );
    }









}

