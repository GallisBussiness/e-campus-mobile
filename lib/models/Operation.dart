import 'package:ecampus/models/Payement.dart';

class Operation {
  final String id;
  final String date;
  final String type;
  final String description;
  final Payement? payementsubject;
  final int montant;

  Operation(this.id, this.date, this.type, this.description, this.montant, this.payementsubject);

  Operation.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        date = json['createdAt'],
        description = json['description'],
        montant = json['montant'],
        type = json['type'],
        payementsubject = json['payement_subject'] != null ? Payement.fromJson(json['payement_subject']) : null;

  static Map<String, dynamic> toJson(Operation operation) {
    return {
      '_id': operation.id,
      'date': operation.date,
      'description': operation.description,
      'montant': operation.montant,
      'type': operation.type
    };
  }
}
