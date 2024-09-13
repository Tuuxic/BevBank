import 'dart:ui';

import 'package:bev_bank/components/cards/beverage_card.dart';
import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/util/screen_size_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                AppLocalizations.of(context)!.beverageTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 3,
                      //   mainAxisSpacing: 10,
                      //   crossAxisSpacing: 10,
                      //   mainAxisExtent: 100,
                      //   childAspectRatio: 1.0,
                      // ),
                      scrollDirection: ScreenSizeDetection.isMobile(context)
                          ? Axis.horizontal
                          : Axis.vertical,
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
                ),
              ))
        ],
      ),
    );
  }
}
