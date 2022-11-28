import 'package:ecampus/manager/manager.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/models/Operation.dart';
import 'package:ecampus/services/compteservice.dart';
import 'package:rxdart/rxdart.dart';

class CompteManager extends Manager {
  final BehaviorSubject<List<Compte>> _compteListSubject =
      BehaviorSubject<List<Compte>>();
  final BehaviorSubject<Compte> _compteSubject = BehaviorSubject<Compte>();

  Stream<List<Compte>> _getComptes() {
    return Stream.fromFuture(CompteService.getComptes());
  }

  Stream<Compte> getCompte(String id) {
    return Stream.fromFuture(CompteService.getCompte(id));
  }

  Stream<List<Operation?>> getTransactions(String id) {
    return Stream.fromFuture(CompteService.getTransactions(id));
  }

  Stream<List<Compte>> get $comptes => _getComptes();

  @override
  void dispose() {
    _compteListSubject.close();
    _compteSubject.close();
  }
}
