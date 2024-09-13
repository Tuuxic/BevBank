import 'package:bev_bank/application/sort/sort_cubit.dart';
import 'package:bev_bank/domain/models/beverage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

part 'beverage_sort_state.dart';

class BeverageSortCubit extends Cubit<SortState<Beverage>>
    with SortCubit<Beverage> {
  @override
  List<SortState<Beverage>> get sortOptions => [
        SortPriceAsc(),
        SortPriceDesc(),
      ];

  BeverageSortCubit() : super(SortPriceAsc());
}
