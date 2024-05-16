import 'dart:convert';

class SignUpDecodable {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  SignUpDecodable({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  factory SignUpDecodable.fromRawJson(String str) =>
      SignUpDecodable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpDecodable.fromJson(Map<String, dynamic> json) =>
      SignUpDecodable(
        kind: json["kind"],
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "localId": localId,
      };
}
