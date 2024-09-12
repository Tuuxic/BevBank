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
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    user.balance.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (user.roomNumber + 1).toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
