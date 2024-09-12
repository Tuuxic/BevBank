import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'beverage_selection_event.dart';
part 'beverage_selection_state.dart';

class BeverageSelectionBloc
    extends Bloc<BeverageSelectionEvent, BeverageSelectionState> {
  BeverageSelectionBloc() : super(BeverageSelection.empty()) {
    on<BeverageSelectionEvent>((event, emit) {
      throw UnimplementedError();
    });
  }
}
