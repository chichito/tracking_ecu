part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class EnabledGps extends AuthState {}

final class DisabledGps extends AuthState {}

final class PermissionDenied extends AuthState {}
