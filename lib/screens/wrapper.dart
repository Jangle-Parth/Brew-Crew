import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/screens/authenticate/authenticate.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// This checks if user is signed or not if signed in return home else authenitcate
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    print(user);

    return Authenticate();
  }
}
