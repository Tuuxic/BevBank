part of 'user_selection_bloc.dart';

@immutable
sealed class UserSelectionState {}

final class NoUserSelectedState extends UserSelectionState {}

final class UserSelectedState extends UserSelectionState {
  final User user;

  UserSelectedState(this.user);
}
