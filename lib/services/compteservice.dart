import 'dart:convert';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/models/Operation.dart';
import 'package:ecampus/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompteService {
  static Future<List<Compte>> getComptes() async {
    http.Response content = await http.get(Uri.parse("$backUrl/api/compte"));
    List body = jsonDecode(content.body);
    return body.map((b) => Compte.fromJson(b)).toList();
  }

  static Future<Compte> getCompte(String id) async {
    http.Response content =
        await http.get(Uri.parse("$backUrl/compte/$id"));
    return Compte.fromJson(jsonDecode(content.body));
  }

    static Future<List<Operation?>> getTransactions(String id) async {
      try {
        http.Response content =
        await http.get(Uri.parse("$backUrl/operation/compte/$id"));
    List body = jsonDecode(content.body);
    return body.map((b) => Operation.fromJson(b)).toList();
      } catch (e) {
        debugPrint(e.toString());
        return [];
      }
    
  }

  static Future<Compte?> getCompteByNce(String nce) async {
    try {
      http.Response content =
          await http.get(Uri.parse("$backUrl/compte/nce/$nce"));
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<Compte?> login(String code, String pass) async {
    try {
      var dto = {"code": code, "password": pass};
      http.Response content = await http.post(
          Uri.parse("$backUrl/compte/login"),
          body: jsonEncode(dto),
          headers: {"content-type": "application/json"});
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<Compte?> updatePass(
      String id, String oldPass, String newPass) async {
    try {
      var dto = {"oldPass": oldPass, "newPass": newPass};
      http.Response content = await http.post(
          Uri.parse("$backUrl/compte/changepassword/$id"),
          body: jsonEncode(dto),
          headers: {"content-type": "application/json"});
      return Compte.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }
}
