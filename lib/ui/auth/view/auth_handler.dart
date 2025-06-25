import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_ecu/ui/auth/bloc/auth_bloc.dart';
import 'package:tracking_ecu/ui/core/navigation/app_navigator.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state.toString());
        switch (state) {
          case DisabledGps():
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppNavigator.gpsPage,
              (route) => false,
            );
            break;
          case EnabledGps():
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppNavigator.homeMap,
              (route) => false,
            );
            break;
          default:
        }
      },
      child: child,
    );
  }
}
