import 'package:ecampus/MyDrawer.dart';
import 'package:ecampus/manager/transfertmanager.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

const color1 = Colors.black;
const color2 = Color(0xFF2ac0a6);
const color3 = Colors.white;

class Transfert extends StatelessWidget {
  Transfert({Key? key, required this.currentId}) : super(key: key);
  final Key formKey = GlobalKey<FormState>();
  final String currentId;
  @override
  Widget build(BuildContext context) {
    TransfertManager transfertManager =
        Provider.of(context).summon<TransfertManager>();
    return Scaffold(
      drawer: MyDrawer(
        id: currentId,
      ),
      appBar: AppBar(
        title: const Text("TRANSFERT", style: TextStyle(fontSize: 22)),
      ),
      body: Container(
          margin: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Observer<String>(
                      stream: transfertManager.nce$,
                      builder: (context, tel) {
                        return TextField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          onChanged: transfertManager.inNce.add,
                          maxLength: 9,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.numbers),
                              labelText: "Numéro de carte",
                              hintText:
                                  "Entrer le numéro étudiant du destinataire",
                              border: OutlineInputBorder()),
                        );
                      }),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Observer<int>(
                    stream: transfertManager.montant$,
                    builder: (context, data) {
                      return TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (v) =>
                              transfertManager.inMontant.add(int.parse(v)),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.money),
                              suffixText: "FCFA",
                              labelText: "Montant en FCFA",
                              hintText: "Entrer le montant à transferer",
                              border: OutlineInputBorder()));
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                    child: RoundedLoadingButton(
                  color: color2,
                  controller: transfertManager.btnController,
                  onPressed: () => transfertManager.submit(context, currentId),
                  child:
                      const Text('TRANSFERER', style: TextStyle(color: color3)),
                )),
                const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
