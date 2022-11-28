class Service {
  final String id;
  final String nom;

  Service(this.id, this.nom);

  Service.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nom = json['nom'];

  static Map<String, dynamic> toJson(Service service) {
    return {
      '_id': service.id,
      'nom': service.nom
    };
  }
}
