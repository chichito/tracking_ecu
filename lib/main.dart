import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:tracking_ecu/ui/auth/bloc/auth_bloc.dart';
import 'package:tracking_ecu/ui/auth/view/auth_handler.dart';
import 'package:tracking_ecu/ui/core/navigation/app_navigator.dart';
import 'package:tracking_ecu/ui/core/theme/app_theme.dart';
import 'package:tracking_ecu/ui/gps/view/gps_page.dart';
import 'package:tracking_ecu/ui/gps/view/home_map.dart';
import 'package:tracking_ecu/ui/root/view/root_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
=======
import 'package:tracking_ecu/features/gps/bloc/gps_bloc.dart';
import 'package:tracking_ecu/pages/loading_page.dart';

>>>>>>> f26d28bba9eaf513f1d5d232e602390002db9ce1
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckGpsPermissionStatus()),
      child: AuthHandler(
        navigatorKey: navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Material App',
          //home: const GpsPage(),
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          routes: {
            AppNavigator.main: (_) => RootPage(),
            AppNavigator.gpsPage: (context) => GpsPage(),
            AppNavigator.homeMap: (context) => HomeMap(),
          },
        ),
=======
    return MaterialApp(
      title: 'Flutter Demo12',
      theme: ThemeData.light(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GpsBloc()
              ..add(GpsInitialStatusEvent())
              ..add(ChangeGpsStatusEvent()),
          ),
        ],
        child: LoadingPage(),
>>>>>>> f26d28bba9eaf513f1d5d232e602390002db9ce1
      ),
    );
  }
}
