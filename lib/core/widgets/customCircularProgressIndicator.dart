import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';

Widget customCircularProgressIndicator({Color color = AppColors.goldColor}) {
  return  Center(
    child: CircularProgressIndicator(
      color: color,
    ),
  );
}