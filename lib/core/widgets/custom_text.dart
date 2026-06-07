import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text,});
final String text;
final Color color = AppColors.goldColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, color: color),
    );
  }
}
