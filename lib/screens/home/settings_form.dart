import 'package:brewcrew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName = '';
  String _currentSugars = '0';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration,
            validator: (value) => value!.isEmpty ? 'Pls Enter Name' : null,
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
              style: TextButton.styleFrom(backgroundColor: Colors.purple[400]),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              },
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
