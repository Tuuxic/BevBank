part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class LoadUsersEvent extends UserEvent {}
