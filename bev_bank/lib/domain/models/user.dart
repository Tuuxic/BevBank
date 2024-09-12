class User {
  final int id;
  final String name;
  final double balance;
  final int roomNumber;

  User({
    required this.id,
    required this.name,
    required this.balance,
    required this.roomNumber,
  });

  const User.invalid({
    this.id = -1,
    this.name = "",
    this.balance = 0.0,
    this.roomNumber = -1,
  });
}
