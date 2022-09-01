class Etudiant {
  final int id;
  final String nce;
  final String prenom;
  final String nom;
  final String dateDeNaissance;

  const Etudiant(
    this.id,
    this.nce,
    this.prenom,
    this.nom,
    this.dateDeNaissance,
  );

  Etudiant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nce = json['nce'],
        prenom = json['prenom'],
        nom = json['nom'],
        dateDeNaissance = json['dateDeNaissance'];

  static Map<String, dynamic> toJson(Etudiant etudiant) {
    // return a map literal with all the non-null key-value pairs
    return {
      'id': etudiant.id,
      'nce': etudiant.nce,
      'prenom': etudiant.prenom,
      'nom': etudiant.nom,
      'dateDeNaissance': etudiant.dateDeNaissance
    };
  }
}
