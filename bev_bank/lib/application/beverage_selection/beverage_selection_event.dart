part of 'beverage_selection_bloc.dart';

@immutable
sealed class BeverageSelectionEvent {}

final class AddBeverageEvent extends BeverageSelectionEvent {
  // final Beverage beverage;
}

final class RemoveBeverageEvent extends BeverageSelectionEvent {
  // final Beverage beverage;
}

final class ResetBeverageSelectionEvent extends BeverageSelectionEvent {}
