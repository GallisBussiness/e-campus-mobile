import 'package:ecampus/manager/manager.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/services/virementservice.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rxdart/subjects.dart';

class SocialManager extends Manager {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final BehaviorSubject<int> _bedSubject = BehaviorSubject<int>();
  final BehaviorSubject<String> _monthSubject =
      BehaviorSubject<String>.seeded("JANVIER");

  Stream<String> get month$ => _monthSubject.stream;
  Stream<int> get bed$ => _bedSubject.stream;
  Sink<String> get inMonth => _monthSubject.sink;
  Sink<int> get inBed => _bedSubject.sink;

  pay(BuildContext context, int id) async {
    if (_bedSubject.hasValue && _monthSubject.hasValue) {
      bool v = await VirementService.paySocial(
          id, _bedSubject.value, _monthSubject.value, 3000);
      if (v) {
        inMonth.add("");
        inBed.add(0);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: color2, content: Text("Payement Réussi")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red, content: Text("Payement echoué")));
      }
    }
    btnController.reset();
  }

  @override
  void dispose() {
    _bedSubject.close();
    _monthSubject.close();
  }
}
