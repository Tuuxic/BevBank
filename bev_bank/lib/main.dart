import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const BevBankApp());
}

class BevBankApp extends StatelessWidget {
  const BevBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BevBank',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        //ColorScheme.fromSeed(seedColor: Colors.green),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routes: AppRoute.routes,
      initialRoute: AppRoute.home.path,
    );
  }
}
