import 'package:brewcrew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({super.key, required this.brew});
  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: const AssetImage("assets/coffee_icon.png"),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugars'),
        ),
      ),
    );
  }
}
