import 'package:ecampus/models/Service.dart';

class Payement {
  final String id;
  final String nom;
  final int prix;
  final Service service;

  Payement(this.id, this.nom, this.prix, this.service);

  Payement.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nom = json['nom'],
        prix = json['prix'],
        service = Service.fromJson(json['service']);

  static Map<String, dynamic> toJson(Payement payement) {
    return {
      '_id': payement.id,
      'nom': payement.nom,
      'prix': payement.prix,
      'service': payement.service
    };
  }
}
