import 'package:flutter/material.dart';

class AssistancePage extends StatelessWidget {
  const AssistancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Assistance ECAMPUS")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text("Email"),
                  Spacer(),
                  Text("bussinessgallis@gmail.com")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text("Téléphone"),
                  Spacer(),
                  Text("(221) 77 926 57 36")
                ],
              ),
            ],
          ),
        ));
  }
}
