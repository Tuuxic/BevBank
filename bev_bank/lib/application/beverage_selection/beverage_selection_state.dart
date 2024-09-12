part of 'beverage_selection_bloc.dart';

@immutable
sealed class BeverageSelectionState extends Equatable {}

final class BeverageSelection extends BeverageSelectionState {
  // final List<Beverage> beverages;
  BeverageSelection.empty();

  @override
  List<Object?> get props => [];

  // BeverageSelection(this.beverages);
}
