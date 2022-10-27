import 'dart:convert';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/services/constants.dart';
import 'package:http/http.dart' as http;

class CompteService {
  static Future<List<Compte>> getComptes() async {
    http.Response content = await http.get(Uri.parse("$backUrl/api/compte"));
    List body = jsonDecode(content.body);
    return body.map((b) => Compte.fromJson(b)).toList();
  }

  static Future<Compte> getCompte(int id) async {
    http.Response content =
        await http.get(Uri.parse("$backUrl/api/compte/$id"));
    return Compte.fromJson(jsonDecode(content.body));
  }

  static Future<Compte?> getCompteByNce(String nce) async {
    try {
      http.Response content =
          await http.get(Uri.parse("$backUrl/api/compte/nce/$nce"));
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<Compte?> login(String code, String pass) async {
    try {
      var dto = {"code": code, "password": pass};
      http.Response content = await http.post(
          Uri.parse("$backUrl/api/compte/login"),
          body: jsonEncode(dto),
          headers: {"content-type": "application/json"});
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<Compte?> updatePass(
      int id, String oldPass, String newPass) async {
    try {
      var dto = {"oldPass": oldPass, "newPass": newPass};
      http.Response content = await http.post(
          Uri.parse("$backUrl/api/compte/$id/changepassword"),
          body: jsonEncode(dto),
          headers: {"content-type": "application/json"});
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }
}
