import 'dart:convert';

import 'package:ecampus/HomePage.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/services/compteservice.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'manager.dart';

class LoginManager extends Manager {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final BehaviorSubject<String> _passSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _codeSubject =
      BehaviorSubject<String>.seeded("486575ec-23bd-447a-b178-b7713a23f842");
  final BehaviorSubject<String> _oldPassSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _newPassSubject = BehaviorSubject<String>();
  Sink<String> get inPass => _passSubject.sink;
  Sink<String> get inCode => _codeSubject.sink;

  Sink<String> get inOldPass => _oldPassSubject.sink;
  Sink<String> get inNewPass => _newPassSubject.sink;

  login(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_codeSubject.hasValue && _passSubject.hasValue) {
        print(_codeSubject.value);
        print(_passSubject.value);
        Compte? compte =
            await CompteService.login(_codeSubject.value, _passSubject.value);

        await prefs.setBool('isLogged', true);
        await prefs.setString('compte', jsonEncode(Compte.toJson(compte!)));
        btnController.reset();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Identifiants incorrect!',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      btnController.reset();
    }
  }

  direct(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Compte? compte = await CompteService.login(
          "36c60b42-45a0-4d6f-8a4e-a11526c9b516", "m98dd5pg8");
      await prefs.setBool('isLogged', true);
      await prefs.setString('compte', jsonEncode(Compte.toJson(compte!)));
      btnController.reset();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Identifiants incorrect!',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      btnController.reset();
    }
  }

  updatePass(context, int id) async {
    String oldPass = _oldPassSubject.value;
    String newPass = _newPassSubject.value;
    try {
      await CompteService.updatePass(id, oldPass, newPass);
      btnController.reset();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: color2, content: Text("Modification Réussi")));
    } catch (e) {
      btnController.reset();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text("Modification echoué")));
    }
  }

  @override
  void dispose() {
    _passSubject.close();
    _codeSubject.close();
    _oldPassSubject.close();
    _newPassSubject.close();
  }
}
