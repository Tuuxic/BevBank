part of 'user_selection_bloc.dart';

@immutable
sealed class UserSelectionEvent {}

final class UserSelectedEvent extends UserSelectionEvent {
  final User user;

  UserSelectedEvent(this.user);
}

final class UserResetEvent extends UserSelectionEvent {}
