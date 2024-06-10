import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/screens/wrapper.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      initialData: MyUser(uid: "123"),
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
