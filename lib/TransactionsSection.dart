import 'package:ecampus/manager/comptemanager.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/models/Operation.dart';
import 'package:ecampus/pages/transfert.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({Key? key, required this.compte}) : super(key: key);
  final Compte compte;

  @override
  Widget build(BuildContext context) {
    CompteManager compteManager = Provider.of(context).summon<CompteManager>();
    return Container(
        color: color3,
        child: Observer<Compte>(
          stream: compteManager.getCompte(compte.id),
          builder: (context, compte) => ListView.separated(
              separatorBuilder: (context, i) =>
                  const Divider(color: color2, height: 20),
              itemCount: compte.operations.length,
              itemBuilder: (context, i) {
                Operation op = compte.operations[i];
                return ListTile(
                  dense: true,
                  leading: op.type == "DPT"
                      ? const CircleAvatar(
                          backgroundColor: color2,
                          child: Icon(
                            Icons.get_app,
                            color: color3,
                          ))
                      : const CircleAvatar(
                          backgroundColor: color2,
                          child: Icon(Icons.outbond, color: color3)),
                  subtitle: Text(
                      "${DateFormat.yMd().format(DateTime.parse(op.date))} à ${DateFormat.Hms().format(DateTime.parse(op.date))}",
                      style: const TextStyle(color: color2)),
                  title: Text(compte.operations[i].description,
                      style: const TextStyle(fontSize: 20)),
                  trailing: Text("${op.montant} FCFA",
                      style: const TextStyle(fontSize: 18)),
                );
              }),
          onError: (context, error) =>
              Text("Snapshot est vide ${error.toString()}"),
          onWaiting: (context) =>
              const Center(child: CircularProgressIndicator()),
        ));
  }
}
