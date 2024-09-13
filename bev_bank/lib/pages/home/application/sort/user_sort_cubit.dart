import 'package:bev_bank/application/sort/sort_cubit.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

part 'user_sort_state.dart';

class UserSortCubit extends Cubit<SortState<User>> with SortCubit<User> {
  @override
  List<SortState<User>> get sortOptions => [
        SortRoomAsc(),
        SortRoomDesc(),
        SortBalanceAsc(),
        SortBalanceDesc(),
      ];

  UserSortCubit() : super(SortRoomAsc());
}
