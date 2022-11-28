class Etudiant {
  final String id;
  final String nce;
  final String prenom;
  final String nom;
  final String email;
  final String tel;
  final String lieuDeNaissance;
  final String avatar;
  final String dateDeNaissance;

  const Etudiant(
    this.id,
    this.nce,
    this.prenom,
    this.avatar,
    this.email,
    this.lieuDeNaissance,
    this.nom,
    this.tel,
    this.dateDeNaissance,
  );

  Etudiant.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nce = json['nce'],
        prenom = json['prenom'],
        nom = json['nom'],
        lieuDeNaissance = json['lieuDeNaissance'],
        tel = json['tel'],
        avatar  = json['avatar'],
        email = json['email'],
        dateDeNaissance = json['dateDeNaissance'];

  static Map<String, dynamic> toJson(Etudiant etudiant) {
    // return a map literal with all the non-null key-value pairs
    return {
      '_id': etudiant.id,
      'nce': etudiant.nce,
      'prenom': etudiant.prenom,
      'nom': etudiant.nom,
      'dateDeNaissance': etudiant.dateDeNaissance,
      'email': etudiant.email,
      'avatar': etudiant.avatar,
      'tel': etudiant.tel,
      'lieuDeNaissance': etudiant.lieuDeNaissance
    };
  }
}
