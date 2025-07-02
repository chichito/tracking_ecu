import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
  }

  Future<void> _onInitialLocationEvent(
    InitialLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    final position = await Geolocator.getCurrentPosition();
    final latLang = LatLng(position.latitude, position.longitude);
    emit(state.copyWith(lastKnownLocation: latLang));
  }
}
