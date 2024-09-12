import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static void goToPage(AppRoute route, BuildContext context) {
    Navigator.pushNamed(context, route.path);
  }
}
