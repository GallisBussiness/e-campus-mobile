import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecampus/models/Compte.dart';
import 'package:ecampus/pages/comptepage.dart';
import 'package:ecampus/pages/depotpage.dart';
import 'package:ecampus/pages/socialpayement.dart';
import 'package:ecampus/pages/transfert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  late SharedPreferences _prefs;
  late Compte compte;
  List<Widget> pages = [
    const Center(child: CircularProgressIndicator()),
    const Center(child: CircularProgressIndicator()),
    const Center(child: CircularProgressIndicator()),
    const Center(child: CircularProgressIndicator())
  ];

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      compte = Compte.fromJson(jsonDecode(_prefs.getString('compte')!));
      pages = [
        ComptePage(
          id: compte.id,
        ),
        Transfert(currentId: compte.id),
        DepotPage(code: compte.code),
        SocialPayement(id: compte.id)
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color3,
        height: 50,
        items: const <Widget>[
          Icon(Icons.person_outline, size: 30, color: Colors.white),
          Icon(Icons.transfer_within_a_station, size: 30, color: Colors.white),
          Icon(Icons.payment, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        color: color2,
        buttonBackgroundColor: color2,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
