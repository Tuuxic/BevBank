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
              title: Text(
                "${AppLocalizations.of(context)!.appTitle} 🍾",
                style:
                    const TextStyle(inherit: true, fontWeight: FontWeight.bold),
              ),
              elevation: 1.0,
              actions: [
                // AppBarButton(
                //   icon: Icons.storage,
                //   label: AppLocalizations.of(context)!.buttonTransaction,
                //   onPressed: () => PageRouter.goToPage(
                //     AppRoute.transactions,
                //     context,
                //   ),
                // ),
                // AppBarButton(
                //   icon: Icons.add,
                //   label: AppLocalizations.of(context)!.buttonAddPayment,
                //   onPressed: () {},
                // ),
                // AppBarButton(
                //   icon: Icons.person,
                //   label: AppLocalizations.of(context)!.buttonAdmin,
                //   onPressed: () => PageRouter.goToPage(AppRoute.admin, context),
                // ),
                AppBarButton(
                  icon: Icons.sort,
                  label: "${AppLocalizations.of(context)!.buttonSortBy}: "
                      "${state.title(context)} $sortSymbol",
                  onPressed: () => context.read<UserSortCubit>().nextSortMode(),
                ),
              ],
            ),
            drawer: Drawer(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.appTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.storage),
                    title:
                        Text(AppLocalizations.of(context)!.buttonTransaction),
                    onTap: () => PageRouter.goToPage(
                      AppRoute.transactions,
                      context,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(AppLocalizations.of(context)!.buttonAdmin),
                    onTap: () => PageRouter.goToPage(
                      AppRoute.admin,
                      context,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(AppLocalizations.of(context)!.buttonSettings),
                    onTap: () => PageRouter.goToPage(
                      AppRoute.settings,
                      context,
                    ),
                  ),
                ],
              ),
            ),
            body: const UserSelector(),
          );
        },
      ),
    );
  }
}
