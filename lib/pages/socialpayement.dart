import 'package:ecampus/manager/socialmanager.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SocialPayement extends StatelessWidget {
  const SocialPayement({Key? key, required this.id}) : super(key: key);
  final String id;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "JANVIER", child: Text("JANVIER")),
      DropdownMenuItem(value: "FEVRIER", child: Text("FEVRIER")),
      DropdownMenuItem(value: "MARS", child: Text("MARS")),
      DropdownMenuItem(value: "AVRIL", child: Text("AVRIL")),
      DropdownMenuItem(value: "JUIN", child: Text("JUIN")),
      DropdownMenuItem(value: "JUILLET", child: Text("JUILLET")),
      DropdownMenuItem(value: "AOÛT", child: Text("AOÛT")),
      DropdownMenuItem(value: "SEPTEMBRE", child: Text("SEPTEMBRE")),
      DropdownMenuItem(value: "OCTOBRE", child: Text("OCTOBRE")),
      DropdownMenuItem(value: "NOVEMBRE", child: Text("NOVEMBRE")),
      DropdownMenuItem(value: "DECEMBRE", child: Text("DECEMBRE")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    SocialManager social = Provider.of(context).summon<SocialManager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payement Social", style: TextStyle(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => social.inBed.add(int.parse(value)),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    labelText: "Numéro de chambre",
                    hintText: "Entrer le numéro de chambre",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 20,
                child: Text("Pour Quel mois ?"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                child: Observer<String>(
                  stream: social.month$,
                  builder: (context, data) => DropdownButton(
                    isExpanded: true,
                    value: data,
                    items: dropdownItems,
                    onChanged: (String? v) => social.inMonth.add(v!),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                  child: RoundedLoadingButton(
                color: color2,
                controller: social.btnController,
                onPressed: () => social.pay(context, id),
                child: const Text('PAYER', style: TextStyle(color: color3)),
              )),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
