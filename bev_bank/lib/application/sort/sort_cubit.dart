import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sort_state.dart';

mixin SortCubit<T> implements Cubit<SortState<T>> {
  List<SortState<T>> get sortOptions;

  int sortIndex = 0;
  void nextSortMode() {
    if (sortOptions.isEmpty) return;

    sortIndex = (sortIndex + 1) % sortOptions.length;
    emit(sortOptions[sortIndex]);
  }
}
