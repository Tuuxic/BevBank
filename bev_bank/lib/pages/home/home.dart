import 'package:bev_bank/application/sort/sort_cubit.dart';
import 'package:bev_bank/application/user/user_bloc.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:bev_bank/pages/home/application/sort/user_sort_cubit.dart';
import 'package:bev_bank/pages/home/components/appbar_button.dart';
import 'package:bev_bank/pages/home/components/user_selector.dart';
import 'package:bev_bank/routing/router.dart';
import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    _userBloc.add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _userBloc),
        BlocProvider(create: (context) => UserSortCubit()),
      ],
      child: BlocBuilder<UserSortCubit, SortState<User>>(
        builder: (context, state) {
          String sortSymbol = state.sort == SortDirection.asc ? "▲" : "▼";
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.appTitle),
              elevation: 1.0,
              actions: [
                AppBarButton(
                  icon: Icons.storage,
                  label: AppLocalizations.of(context)!.buttonTransaction,
                  onPressed: () => PageRouter.goToPage(
                    AppRoute.transactions,
                    context,
                  ),
                ),
                AppBarButton(
                  icon: Icons.add,
                  label: AppLocalizations.of(context)!.buttonAddPayment,
                  onPressed: () {},
                ),
                AppBarButton(
                  icon: Icons.sort,
                  label: "${AppLocalizations.of(context)!.buttonSortBy}: "
                      "${state.title(context)} $sortSymbol",
                  onPressed: () {
                    context.read<UserSortCubit>().nextSortMode();
                  },
                ),
              ],
            ),
            body: const UserSelector(),
          );
        },
      ),
    );
  }
}
