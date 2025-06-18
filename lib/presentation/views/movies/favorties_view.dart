import 'package:flutter/material.dart';

class FavortiesView extends StatelessWidget {
  const FavortiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }
}
