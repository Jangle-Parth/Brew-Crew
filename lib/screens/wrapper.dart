import 'package:brewcrew/screens/home/home.dart';
import 'package:flutter/cupertino.dart';

// This checks if user is signed or not if signed in return home else authenitcate
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
