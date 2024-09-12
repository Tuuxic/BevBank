import 'package:bev_bank/components/cards/user_card.dart';
import 'package:bev_bank/routing/router.dart';
import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BevBank'),
        elevation: 1.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {},
              label: Text("Transactions"),
              icon: const Icon(Icons.storage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {},
              label: Text("Add Payment"),
              icon: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {},
              label: Text("Sort By: Room"),
              icon: const Icon(Icons.sort),
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 120,
                  ),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return UserCard.fromProps(
                      id: 0,
                      name: 'User ${index + 1}',
                      balance: 1000.0,
                      roomNumber: index,
                      onTap: () =>
                          PageRouter.goToPage(AppRoute.selection, context),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
