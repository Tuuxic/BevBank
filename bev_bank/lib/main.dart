// import 'package:bev_bank/application/beverage_selection/beverage_selection_bloc.dart';
// import 'package:bev_bank/application/user/user_bloc.dart';
// import 'package:bev_bank/application/user/user_bloc.dart';
import 'package:bev_bank/application/user_selection/user_selection_bloc.dart';
import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const BevBankApp());
}

class BevBankApp extends StatelessWidget {
  const BevBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserSelectionBloc()),
        // BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'BevBank',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        routes: AppRoute.routes,
        initialRoute: AppRoute.home.path,
      ),
    );
  }
}
