part of 'auth_bloc.dart';

sealed class AuthEvent {}

class CheckGpsStatus extends AuthEvent {}

class CheckGpsPermission extends AuthEvent {}
