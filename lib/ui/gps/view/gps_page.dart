import 'package:flutter/material.dart';
import 'package:tracking_ecu/ui/gps/widgets/enable_gps.dart';
import 'package:tracking_ecu/ui/gps/widgets/permissions_gps.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final valor = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(body: valor == 1 ? EnableGps() : PermissionsGps());
  }
}
