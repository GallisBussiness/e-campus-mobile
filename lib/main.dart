import 'package:ecampus/HomePage.dart';
import 'package:ecampus/manager/comptemanager.dart';
import 'package:ecampus/manager/loginmanager.dart';
import 'package:ecampus/manager/socialmanager.dart';
import 'package:ecampus/manager/transfertmanager.dart';
import 'package:ecampus/pages/loginpage.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:ecampus/providers/provider.dart';
import 'package:ecampus/utils/supervisor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Provider(
      data: Supervisor()
          .register<CompteManager>(() => CompteManager())
          .register<TransfertManager>(() => TransfertManager())
          .register<LoginManager>(() => LoginManager())
          .register<SocialManager>(() => SocialManager()),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _prefs;
  late bool isLogged = false;

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    isLogged = _prefs.getBool('isLogged') ?? false;
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ECAMPUS",
      home: isLogged ? const HomePage() : const LoginPage(),
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
              color: color2,
              iconTheme: IconThemeData(color: color3),
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(color: color3)),
          buttonTheme: const ButtonThemeData(buttonColor: color2)),
    );
  }
}
