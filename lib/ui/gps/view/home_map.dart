import 'package:flutter/material.dart';

class HomeMap extends StatelessWidget {
  const HomeMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Map')),
      body: Center(child: Text('Map will be displayed here')),
    );
  }
}
