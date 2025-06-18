import 'package:flutter/material.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites view'),
      ),
      body: Center(
        child: Text('Favorites owo'),
      ),
    );
  }
}
