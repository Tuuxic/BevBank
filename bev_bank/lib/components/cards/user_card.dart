import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  final void Function()? onTap;
  final double height;

  const UserCard({
    super.key,
    required this.user,
    this.onTap,
    this.height = 10.0,
  });

  UserCard.fromProps({
    super.key,
    required id,
    required name,
    required balance,
    required roomNumber,
    this.onTap,
    this.height = 10.0,
  }) : user = User(id: 0, name: name, balance: balance, roomNumber: roomNumber);

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    user.balanceToString(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _balanceColor(user.balance),
                        ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      user.roomNumberToString(),
                      textScaler: const TextScaler.linear(1.5),
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _balanceColor(int balance) {
    if (balance > 0) {
      return Colors.green;
    } else if (balance == 0) {
      return Colors.grey;
    } else if (balance < 0 && balance > -3000) {
      return Colors.redAccent;
    } else if (balance <= -3000) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }
}
