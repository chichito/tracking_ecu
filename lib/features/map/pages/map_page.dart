import 'package:flutter/material.dart';
import 'package:tracking_ecu/features/map/widgets/floating_actions_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MAPA')),
      body: Center(child: SafeArea(child: Text('cento MAPA'))),
      floatingActionButton: const FloatingActionsMap(),
    );
  }
}
