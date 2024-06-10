import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});
  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Register'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign In'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Pls Provide a Valid Email';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[400]),
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          )),
    );
  }
}
