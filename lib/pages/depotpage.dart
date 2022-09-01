import 'package:ecampus/pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DepotPage extends StatelessWidget {
  const DepotPage({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color2,
          title: const Text(
            "DEPOT",
            style: TextStyle(color: color3, fontSize: 22),
          ),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 248, 244),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Hero(
                    tag: "qr_code",
                    child: QrImage(
                      data: code,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
