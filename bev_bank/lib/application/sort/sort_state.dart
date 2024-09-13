part of 'sort_cubit.dart';

enum SortDirection {
  asc(name: "Asc"),
  desc(name: "Desc");

  const SortDirection({required this.name});
  final String name;
}

abstract class SortState<T> extends Equatable {
  const SortState();

  SortDirection get sort;
  String title(BuildContext context);
  int sortFunction(T a, T b);

  @override
  List<Object> get props => [];
}
