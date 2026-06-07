import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_strings.dart';
import 'package:gold_salver_prices/core/networking/dio_helper.dart';
import 'package:gold_salver_prices/core/routing/app_router.dart';
import 'package:gold_salver_prices/core/routing/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const GoldSalverPricesApp());
}

class GoldSalverPricesApp extends StatelessWidget {
  const GoldSalverPricesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
