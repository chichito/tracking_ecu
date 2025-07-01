import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckGpsPermissionStatus>(_checkGpsPermissionStatusEvent);
  }

  FutureOr<void> _checkGpsPermissionStatusEvent(event, emit) async {
    // TODO: implement event handler
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return emit(DisabledGps());
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      print(permission.toString());
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return emit(PermissionDenied());
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return emit(PermissionDenied());
      }
      return emit(PermissionGranted());
    }
  }
}
