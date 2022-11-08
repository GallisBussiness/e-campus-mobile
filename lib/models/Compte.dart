import 'package:ecampus/models/Etudiant.dart';
import 'package:ecampus/models/Operation.dart';

class Compte {
  final int id;
  final double solde;
  final String code;
  final Etudiant etudiant;
  final List<Operation> operations;

  Compte(this.id, this.solde, this.code, this.etudiant, this.operations);

  factory Compte.fromJson(Map<String, dynamic> json) {
    List operation = json['operations'];
    List<Operation> op = operation.reversed.map((o) => Operation.fromJson(o)).toList();
    return Compte(json['id'], json['solde'], json['code'],
        Etudiant.fromJson(json['etudiant']), op);
  }

  static Map<String, dynamic> toJson(Compte compte) {
    return {
      'id': compte.id,
      'code': compte.code,
      'solde': compte.solde,
      'operations': compte.operations.map((o) => Operation.toJson(o)).toList(),
      'etudiant': Etudiant.toJson(compte.etudiant)
    };
  }
}
