import 'package:ecampus/manager/manager.dart';
import 'package:ecampus/pages/transfert.dart';
import 'package:ecampus/services/virementservice.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rxdart/rxdart.dart';

class TransfertManager extends Manager {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final BehaviorSubject<String> _nce = BehaviorSubject<String>.seeded("");
  final BehaviorSubject<int> _montant = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  Stream<String> get nce$ => _nce.stream;
  Sink<String> get inNce => _nce.sink;
  Stream<int> get montant$ => _montant;
  Sink<int> get inMontant => _montant.sink;

  submit(context, String id) async {
    String nce = _nce.value;
    int montant = _montant.value;
    bool v = await VirementService.transfert(nce, id, montant);
    btnController.reset();
    if (v) {
      inNce.add("");
      inMontant.add(0);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: color2, content: Text("Transfert Réussi")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text("Transfert echoué")));
    }
  }

  @override
  void dispose() {
    _nce.close();
    _montant.close();
  }
}
