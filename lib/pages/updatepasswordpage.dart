import 'package:ecampus/manager/loginmanager.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({Key? key, required this.currentId}) : super(key: key);
  final Key formKey = GlobalKey<FormState>();
  final String currentId;
  @override
  Widget build(BuildContext context) {
    LoginManager loginManager = Provider.of(context).summon<LoginManager>();

    return Scaffold(
      appBar: AppBar(title: const Text("Modifer votre Mot de Passe")),
      body: Container(
          margin: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    onChanged: loginManager.inOldPass.add,
                    maxLength: 9,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        labelText: "Ancien mot de passe",
                        hintText: "Entrer l'ancien mot de passe",
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextField(
                      onChanged: loginManager.inNewPass.add,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.security),
                          labelText: "Nouveau mot de passe",
                          hintText: "Entrer le nouveau mot de passe",
                          border: OutlineInputBorder())),
                ),
                const SizedBox(height: 30),
                Center(
                    child: RoundedLoadingButton(
                  color: color2,
                  controller: loginManager.btnController,
                  onPressed: () => loginManager.updatePass(context, currentId),
                  child: const Text('MODIFER MOT DE PASSE',
                      style: TextStyle(color: color3)),
                )),
                const SizedBox(height: 10)
              ],
            ),
          )),
    );
  }
}
