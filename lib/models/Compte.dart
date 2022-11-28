import 'package:ecampus/models/Etudiant.dart';

class Compte {
  final String id;
  final int solde;
  final String code;
  final Etudiant etudiant;

  Compte(this.id, this.solde, this.code, this.etudiant);

  factory Compte.fromJson(Map<String, dynamic> json) {
    return Compte(json['_id'], json['solde'], json['code'],
        Etudiant.fromJson(json['etudiant']));
  }

  static Map<String, dynamic> toJson(Compte compte) {
    return {
      '_id': compte.id,
      'code': compte.code,
      'solde': compte.solde,
      'etudiant': Etudiant.toJson(compte.etudiant)
    };
  }
}
