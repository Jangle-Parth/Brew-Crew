import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});
  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign In'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
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
                  print(email);
                  print(password);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[400]),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          )),
    );
  }
}
