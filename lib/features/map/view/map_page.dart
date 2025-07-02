import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_ecu/features/map/bloc/location_bloc.dart';
import 'package:tracking_ecu/features/map/widgets/floating_actions_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? googleMapController;

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(InitialLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state.lastKnownLocation == null) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: state.lastKnownLocation!,
                zoom: 15,
              ),
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              onMapCreated: (controller) {
                googleMapController = controller;
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionsMap(
        googleMapController: googleMapController,
      ),
    );
  }
}
