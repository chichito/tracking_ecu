import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_ecu/core/theme.dart/app_theme.dart';
import 'package:tracking_ecu/features/gps/bloc/gps_bloc.dart';
import 'package:tracking_ecu/features/map/bloc/location_bloc.dart';
import 'package:tracking_ecu/loading/view/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        ],
        child: LoadingPage(),
      ),
      theme: AppTheme.light,
    );
  }
}
