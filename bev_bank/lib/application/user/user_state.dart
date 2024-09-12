part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UsersLoading extends UserState {}

final class UsersLoaded extends UserState {
  final List<User> users;

  UsersLoaded(this.users);
}

final class UsersLoadError extends UserState {
  final String message;

  UsersLoadError(this.message);
}
