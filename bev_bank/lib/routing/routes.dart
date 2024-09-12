import 'package:bev_bank/domain/models/user.dart';
import 'package:bev_bank/pages/home/home.dart';
import 'package:bev_bank/pages/selection/selection.dart';
import 'package:bev_bank/pages/transaction/transaction.dart';
import 'package:flutter/material.dart';

enum AppRoute {
  home(path: "/home"),
  transactions(path: "/transactions"),
  selection(path: "/selection");

  const AppRoute({required this.path});

  final String path;

  static Map<String, WidgetBuilder> get routes => {
        home.path: (context) => const HomePage(),
        transactions.path: (context) => const TransactionsPage(),
        selection.path: (context) => const SelectionPage(user: User.invalid()),
      };
}
