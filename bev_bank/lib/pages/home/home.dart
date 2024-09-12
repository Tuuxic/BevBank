import 'package:bev_bank/application/user/user_bloc.dart';
import 'package:bev_bank/pages/home/components/appbar_button.dart';
import 'package:bev_bank/pages/home/components/user_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        elevation: 1.0,
        actions: [
          AppBarButton(
            icon: Icons.storage,
            label: AppLocalizations.of(context)!.buttonTransaction,
            onPressed: () {},
          ),
          AppBarButton(
            icon: Icons.add,
            label: AppLocalizations.of(context)!.buttonAddPayment,
            onPressed: () {},
          ),
          AppBarButton(
            onPressed: () {},
            label: "${AppLocalizations.of(context)!.buttonSortBy}: "
                "${AppLocalizations.of(context)!.filterOptionRoom}",
            icon: Icons.sort,
          ),
        ],
      ),
      body: const UserSelector(),
    );
  }
}
