import 'package:ecampus/MyDrawer.dart';
import 'package:ecampus/QrSection.dart';
import 'package:ecampus/TransactionsSection.dart';
import 'package:ecampus/manager/comptemanager.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/observer.dart';
import 'package:flutter/material.dart';

class ComptePage extends StatelessWidget {
  const ComptePage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    CompteManager compteManager = Provider.of(context).summon<CompteManager>();

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MyDrawer(id: id),
        appBar: AppBar(
            title: const Text("Mon Compte", style: TextStyle(fontSize: 22)),
            elevation: 0),
        body: Observer<Compte>(
          stream: compteManager.getCompte(id),
          builder: (context, compte) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Solde : ${compte.solde} FCFA",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                QrSection(compte: compte),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TransactionsSection(
                      compte: compte), //TransactionsSection()
                )
              ],
            );
          },
        ));
  }
}
