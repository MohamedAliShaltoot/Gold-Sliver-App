import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/presentation/home_screen.dart';
import 'package:gold_salver_prices/core/routing/routes.dart';
import 'package:gold_salver_prices/features/gold/presentation/screens/gold_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.goldScreen:
        return MaterialPageRoute(builder: (context) => GoldScreen());
      // case AppRoutes.silverScreen:
      //   return MaterialPageRoute(builder: (context) => SilverScreen());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Page Not Found'),
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        ));
    }
  }
}