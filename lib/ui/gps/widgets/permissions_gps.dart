import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionsGps extends StatelessWidget {
  const PermissionsGps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/enable_gps.png', width: 200),
          const SizedBox(height: 40),
          const Text(
            'Ubicación',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Necesitamos acceder a tu ubicacion para mostrarte tus rutas e informacion de tu rendimiento',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () async {
              LocationPermission permission =
                  await Geolocator.checkPermission();

              if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();

                if (permission == LocationPermission.denied) {
                  return print("Location permission denied");
                }
              }

              if (permission == LocationPermission.deniedForever) {
                return print('Location permissions are permanently denied');
              }
            },
            child: const Text('Solicitar Permisos'),
          ),
        ],
      ),
    );
  }
}
