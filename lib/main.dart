import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_ecu/core/theme/app_theme.dart';
import 'package:tracking_ecu/features/gps/bloc/gps_bloc.dart';
import 'package:tracking_ecu/features/map/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_ecu/features/map/bloc/map_cubit/map_cubit.dart';
import 'package:tracking_ecu/loading/view/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //https://docs.flutter.dev/
  //https://docs.flutter.dev/codelabs
  //https://docs.flutter.dev/codelabs
  //https://github.com/flutter/samples/tree/main/android_splash_screen
  //https://flutter.dev/docs/development/ui/advanced/splash-screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GpsBloc()
              ..add(GpsInitialStatusEvent())
              ..add(ChangeGpsStatusEvent()),
          ),
          BlocProvider(create: (context) => LocationBloc()),
          BlocProvider(create: (context) => MapCubit()),
        ],
        child: LoadingPage(),
      ),
      theme: AppTheme.light,
    );
  }
}
