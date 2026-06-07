import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';
import 'package:gold_salver_prices/core/constants/app_images.dart';
import 'package:gold_salver_prices/core/constants/app_strings.dart';
import 'package:gold_salver_prices/features/gold/presentation/screens/widgets/custom_text.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          AppStrings.goldTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.goldColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.goldImage, height: 200),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: '1500 '),
             CustomText(text: 'EGP'),
            ],
          ),
        ],
      ),
    );
  }
}


