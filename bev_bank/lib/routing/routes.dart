import 'package:bev_bank/pages/admin/admin_page.dart';
import 'package:bev_bank/pages/home/home_page.dart';
import 'package:bev_bank/pages/selection/selection_page.dart';
import 'package:bev_bank/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';

enum AppRoute {
  home(path: "/home"),
  transactions(path: "/transactions"),
  selection(path: "/selection"),
  admin(path: "/admin");

  const AppRoute({required this.path});

  final String path;

  static Map<String, WidgetBuilder> get routes => {
        home.path: (context) => const HomePage(),
        transactions.path: (context) => const TransactionsPage(),
        selection.path: (context) => const SelectionPage(),
        admin.path: (context) => const AdminPage(),
      };
}
