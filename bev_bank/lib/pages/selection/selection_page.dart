import 'package:bev_bank/application/beverage_selection/beverage_selection_bloc.dart';
import 'package:bev_bank/application/user_selection/user_selection_bloc.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:bev_bank/pages/selection/application/sort/beverage_sort_cubit.dart';
import 'package:bev_bank/pages/selection/components/beverage_confirmation.dart';
import 'package:bev_bank/pages/selection/components/beverage_selection.dart';
import 'package:bev_bank/pages/selection/components/shopping_cart.dart';
import 'package:bev_bank/util/screen_size_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int _totalSpending = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BeverageSelectionBloc()),
        BlocProvider(create: (context) => BeverageSortCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.pageSelectionTitle),
          elevation: 1.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<UserSelectionBloc, UserSelectionState>(
          builder: (context, state) {
            switch (state) {
              case UserSelectedState state:
                return displayBeverageSelection(state.user);
              case NoUserSelectedState _:
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.noUserSelectedWarning,
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  Widget displayBeverageSelection(User user) {
    bool isMobile = ScreenSizeDetection.isMobile(context);

    return BlocBuilder<BeverageSelectionBloc, BeverageSelectionState>(
      builder: (context, state) {
        switch (state) {
          case BeverageSelection _:
            return isMobile ? mobileView(user) : wideScreenView(user);
        }
      },
    );
  }

  Widget wideScreenView(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Flexible(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(flex: 1, child: BeverageSelectionCard()),
                Flexible(flex: 1, child: ShoppingCartDataTable())
              ],
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 16.0,
            ),
            child: BeverageConfirmation(
              user: user,
              totalSpending: _totalSpending,
            ),
          ),
        )
      ],
    );
  }

  Widget mobileView(User user) {
    return CustomScrollView(
      // mainAxisSize: MainAxisSize.min,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 16.0,
                ),
                child: BeverageSelectionCard(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: ShoppingCartDataTable(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 16.0,
                ),
                child: BeverageConfirmation(
                  user: user,
                  totalSpending: _totalSpending,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
