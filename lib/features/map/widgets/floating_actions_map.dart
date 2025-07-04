import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_ecu/features/map/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_ecu/features/map/bloc/map_cubit/map_cubit.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();
    final locationBloc = context.read<LocationBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          onPressed: () {
            locationBloc.add(ToggleShowLocationEvent());
          },
          child: Icon(Icons.more_vert),
        ),
        FloatingActionButton.small(
          onPressed: () {
            final lastKnownLocation = locationBloc.state.lastKnownLocation;
            if (lastKnownLocation == null) return;
            mapCubit.moveCamera(lastKnownLocation);
          },
          child: Icon(Icons.my_location),
        ),
      ],
    );
  }
}
