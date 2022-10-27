import 'package:ecampus/manager/loginmanager.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginManager loginManager = Provider.of(context).summon<LoginManager>();

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            // loginManager.inCode.add(await Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => const QRViewPage())));
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 248, 244),
                  borderRadius: BorderRadius.circular(200)),
              height: 200,
              width: 200,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: color3),
                  child: QrImage(data: 'logintoecampus', size: 150)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
              onChanged: loginManager.inPass.add,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.security),
                  labelText: "Mot de passe",
                  hintText: "Entrer le mot de passe",
                  border: OutlineInputBorder())),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: RoundedLoadingButton(
          color: color2,
          controller: loginManager.btnController,
          onPressed: () => loginManager.login(context),
          child:
              const Text('LOGIN TO ECAMPUS!', style: TextStyle(color: color3)),
        )),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: RoundedLoadingButton(
          color: color2,
          controller: loginManager.btnController,
          onPressed: () => loginManager.direct(context),
          child: const Text('ACCESS DIRECT', style: TextStyle(color: color3)),
        )),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
