import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    if (brews == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (brews.isEmpty) {
      return const Center(child: Text('No brews available'));
    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (BuildContext context, int index) {
        print('Rendering BrewTile for brew: ${brews[index].name}');
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
