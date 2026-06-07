import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';
import 'package:gold_salver_prices/core/constants/app_strings.dart';
import 'package:gold_salver_prices/core/routing/routes.dart';
import 'package:gold_salver_prices/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.homeTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: AppStrings.goldBtn,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.goldScreen);
            },
            btnBackgroundColor: AppColors.goldColor,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: AppStrings.silverBtn,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.silverScreen);
            },
            btnBackgroundColor: AppColors.silverColor,
          ),
        ],
      ),
    );
  }
}
