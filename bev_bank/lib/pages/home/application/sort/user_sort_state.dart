part of 'user_sort_cubit.dart';

final class SortRoomAsc extends SortState<User> {
  @override
  SortDirection get sort => SortDirection.asc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionRoom;

  @override
  int sortFunction(a, b) {
    return a.roomNumber.compareTo(b.roomNumber);
  }
}

final class SortRoomDesc extends SortState<User> {
  @override
  SortDirection get sort => SortDirection.desc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionRoom;

  @override
  int sortFunction(a, b) {
    return -a.roomNumber.compareTo(b.roomNumber);
  }
}

final class SortBalanceAsc extends SortState<User> {
  @override
  SortDirection get sort => SortDirection.asc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionDebt;

  @override
  int sortFunction(User a, User b) {
    return a.balance.compareTo(b.balance);
  }
}

final class SortBalanceDesc extends SortState<User> {
  @override
  SortDirection get sort => SortDirection.desc;
  @override
  title(BuildContext context) => AppLocalizations.of(context)!.filterOptionDebt;
  @override
  int sortFunction(User a, User b) {
    return -a.balance.compareTo(b.balance);
  }
}
