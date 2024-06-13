import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/services/database.dart';
import 'package:brewcrew/shared/constants.dart';
import 'package:brewcrew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName = ' ';
  String _currentSugars = '0';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return Loading();
    }
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data!;
            if (_currentName.isEmpty) {
              _currentName = userData.name;
            }
            if (_currentSugars == '0') {
              _currentSugars = userData.sugars;
            }
            if (_currentStrength == 100) {
              _currentStrength = userData.strength;
            }

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Update Your Brew Settings',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (value) =>
                        value!.isEmpty ? 'Pls Enter Name' : null,
                    onChanged: (value) => setState(() {
                      _currentName = value;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar cubes'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _currentSugars = value!;
                      });
                    },
                  ),
                  Slider(
                      min: 100,
                      max: 900,
                      divisions: 8,
                      value: _currentStrength.toDouble(),
                      activeColor: Colors.brown[_currentStrength],
                      inactiveColor: Colors.brown[_currentStrength],
                      onChanged: (value) {
                        setState(() {
                          _currentStrength = value.round();
                        });
                      }),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.purple[400]),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars, _currentName, _currentStrength);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
