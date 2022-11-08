import 'package:ecampus/pages/assistancepage.dart';
import 'package:ecampus/pages/loginpage.dart';
import 'package:ecampus/pages/transfert.dart';
import 'package:ecampus/pages/updatepasswordpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late SharedPreferences _prefs;

  signOut() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [color2, color3])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/ecampus.png"),
                backgroundColor: Colors.white,
                radius: 50,
              ),
            ),
          )),
          ListTile(
            title: const Text(
              'Contacter l\'assistance',
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.phone),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AssistancePage()));
            },
          ),
          const Divider(height: 4, color: color2),
          ListTile(
              title: const Text(
                'Modifier votre code secret',
                style: TextStyle(fontSize: 16),
              ),
              leading: const Icon(Icons.edit),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdatePasswordPage(
                          currentId: widget.id,
                        )));
              }),
          const Divider(height: 4, color: Colors.black),
          ListTile(
            title: const Text(
              'Se déconnecter',
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.arrow_right),
            onTap: () async {
              bool success = await _prefs.remove('isLogged');
              if (success) {
                signOut();
              }
            },
          ),
        ],
      ),
    );
  }
}
