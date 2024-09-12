import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_selection_event.dart';
part 'user_selection_state.dart';

class UserSelectionBloc extends Bloc<UserSelectionEvent, UserSelectionState> {
  UserSelectionBloc() : super(NoUserSelectedState()) {
    on<UserSelectedEvent>((event, emit) {
      emit(UserSelectedState(event.user));
    });
    on<UserResetEvent>((event, emit) {
      throw UnimplementedError();
    });
  }
}
