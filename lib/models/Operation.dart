import 'package:ecampus/models/Compte.dart';

class Operation {
  final int id;
  final String date;
  final String type;
  final String description;
  final double montant;

  Operation(this.id, this.date, this.type, this.description, this.montant);

  Operation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        description = json['description'],
        montant = json['montant'],
        type = json['type'];

  static Map<String, dynamic> toJson(Operation operation) {
    return {
      'id': operation.id,
      'date': operation.date,
      'description': operation.description,
      'montant': operation.montant,
      'type': operation.type
    };
  }
}
