import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_ecu/ui/auth/bloc/auth_bloc.dart';
import 'package:tracking_ecu/ui/auth/view/auth_handler.dart';
import 'package:tracking_ecu/ui/core/navigation/app_navigator.dart';
import 'package:tracking_ecu/ui/core/theme/app_theme.dart';
import 'package:tracking_ecu/ui/gps/view/gps_page.dart';
import 'package:tracking_ecu/ui/gps/view/home_map.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckGpsStatus()),
      child: AuthHandler(
        navigatorKey: navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Material App',
          //home: const GpsPage(),
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          routes: {
            AppNavigator.gpsPage: (context) => const GpsPage(),
            AppNavigator.homeMap: (context) => const HomeMap(),
          },
        ),
      ),
    );
  }
}
