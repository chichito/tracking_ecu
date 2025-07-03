import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_ecu/features/map/bloc/location_bloc/location_bloc.dart';

class FloatingActionsMap extends StatelessWidget {
  const FloatingActionsMap({super.key, required this.googleMapController});

  final GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: 'polyline',
          onPressed: () {
            //mapCubit.toggleShowPolyline();
          },
          child: const Icon(Icons.more_horiz),
        ),
        FloatingActionButton.small(
          heroTag: 'location',
          onPressed: () {
            final lastKnownLocation = context
                .read<LocationBloc>()
                .state
                .lastKnownLocation;
            if (lastKnownLocation == null) return;
            googleMapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: lastKnownLocation, zoom: 30),
              ),
            );
          },
          child: const Icon(Icons.gps_fixed),
        ),
      ],
    );
  }
}
