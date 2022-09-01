import 'package:ecampus/models/Etudiant.dart';
import 'dart:convert';
import 'package:ecampus/services/constants.dart';
import 'package:http/http.dart' as http;

class EtudiantService {
  static Future<List<Etudiant>> getEtudiants() async {
    http.Response content = await http.get(Uri.parse("$backUrl/api/etudiants"));
    List body = jsonDecode(content.body);
    return body.map((b) => Etudiant.fromJson(b)).toList();
  }

  static Future<Etudiant> getEtudiant(int id) async {
    http.Response content =
        await http.get(Uri.parse("$backUrl/api/etudiants/$id"));
    return Etudiant.fromJson(jsonDecode(content.body));
  }
}
