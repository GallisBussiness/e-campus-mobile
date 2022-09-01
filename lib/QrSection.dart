import 'package:ecampus/manager/comptemanager.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/pages/depotpage.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const color2 = Color.fromARGB(255, 224, 248, 244);

class QrSection extends StatelessWidget {
  const QrSection({Key? key, required this.compte}) : super(key: key);
  final Compte compte;
  @override
  Widget build(BuildContext context) {
    CompteManager compteManager = Provider.of(context).summon<CompteManager>();
    return Center(
      child: Container(
          height: 200,
          width: 200,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(200),
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Observer<Compte>(
              stream: compteManager.getCompte(compte.id),
              builder: (context, compte) => Center(
                  child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DepotPage(
                          code: compte.code,
                        ))),
                child: Hero(
                  tag: "qr_code",
                  child: QrImage(
                    data: compte.code,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              )),
              onError: (context, error) =>
                  Text("Snapshot est vide ${error.toString()}"),
              onWaiting: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          )),
    );
  }
}
