import 'dart:ui';

import 'package:bev_bank/application/sort/sort_cubit.dart';
import 'package:bev_bank/components/cards/beverage_card.dart';
import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/domain/models/beverage.dart';
import 'package:bev_bank/pages/selection/application/sort/beverage_sort_cubit.dart';
import 'package:bev_bank/util/screen_size_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BeverageSelectionCard extends StatelessWidget {
  const BeverageSelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Beverage> beverages = List.generate(
      20,
      (index) => Beverage(
        name: "Item $index",
        price: index * 100,
        volume: index * 10,
      ),
    );
    return BlocBuilder<BeverageSortCubit, SortState<Beverage>>(
      builder: (context, state) {
        beverages.sort(state.sortFunction);
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
                        itemCount: beverages.length,
                        itemBuilder: (context, index) {
                          final beverage = beverages[index];
                          return BeverageCard(
                            name: beverage.name,
                            price: beverage.price,
                            volume: beverage.volume,
                            onTap: () {},
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
