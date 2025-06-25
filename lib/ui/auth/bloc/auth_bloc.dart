import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckGpsStatus>((event, emit) async {
      // TODO: implement event handler
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      print(serviceEnabled);
      if (!serviceEnabled) {
        return emit(DisabledGps());
      } else {
        return emit(EnabledGps());
      }
    });
    on<CheckGpsPermission>((event, emit) {
      // TODO: implement event handler
    });
  }
}
