import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UsersLoading()) {
    on<LoadUsersEvent>((event, emit) async {
      await _loadUsers(emit);
    });
  }

  _loadUsers(Emitter<UserState> emit) async {
    await Future.delayed(const Duration(seconds: 2));

    // bool success = true;

    // if (!success) {
    // emit(UsersLoadError("Failed to load users"));
    // return;
    // }

    List<User> users = List.generate(
      15,
      (i) => User(
        id: i,
        name: "User ${i + 1}",
        balance: (i % 2 == 0 ? -1 : 1) * i * 500,
        roomNumber: i + 1,
      ),
    );

    emit(UsersLoaded(users));
  }
}
