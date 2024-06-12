import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/screens/home/brew_list.dart';
import 'package:brewcrew/screens/home/settings_form.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showsettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: const SettingsForm());
          });
    }

    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label: const Text('logout'),
            ),
            TextButton.icon(
              onPressed: () {
                _showsettings();
              },
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
            ),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
