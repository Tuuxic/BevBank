class User {
  final int id;
  final String name;
  final int balance;
  final int roomNumber;

  User({
    required this.id,
    required this.name,
    required this.balance,
    required this.roomNumber,
  });

  String balanceToString() {
    return "${(balance / 100).toStringAsFixed(2)}€";
  }

  String roomNumberToString() {
    return roomNumber.toString().padLeft(2, '0');
  }
}
