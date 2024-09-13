part of 'beverage_sort_cubit.dart';

final class SortPriceAsc extends SortState<Beverage> {
  @override
  SortDirection get sort => SortDirection.asc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionDebt;
  @override
  int sortFunction(Beverage a, Beverage b) {
    return a.price.compareTo(b.price);
  }
}

final class SortPriceDesc extends SortState<Beverage> {
  @override
  SortDirection get sort => SortDirection.desc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionDebt;
  @override
  int sortFunction(Beverage a, Beverage b) {
    return -a.price.compareTo(b.price);
  }
}
