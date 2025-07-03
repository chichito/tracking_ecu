import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState());

  GoogleMapController? _mapController;

  // Inicializar el controlador del mapa
  void onMapInitialized(GoogleMapController controller) {
    _mapController = controller;
  }

  // Metodo para mover la camara a una posición espefica
  void moveCamera(LatLng target) {
    final cameraUpdate = CameraUpdate.newLatLng(target);
    _mapController?.animateCamera(cameraUpdate);
  }
}
