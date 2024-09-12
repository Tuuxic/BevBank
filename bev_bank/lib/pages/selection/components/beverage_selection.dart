import 'package:bev_bank/components/cards/beverage_card.dart';
import 'package:bev_bank/components/cards/content_card.dart';
import 'package:flutter/material.dart';

class BeverageSelectionCard extends StatelessWidget {
  const BeverageSelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Items",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: GridView.builder(
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 3,
                    //   mainAxisSpacing: 10,
                    //   crossAxisSpacing: 10,
                    //   mainAxisExtent: 100,
                    //   childAspectRatio: 1.0,
                    // ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                      // mainAxisExtent: 200,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return BeverageCard(
                        name: "Item $index",
                        price: index * 100,
                        onTap: () {},
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
