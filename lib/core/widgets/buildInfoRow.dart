import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';

Widget buildInfoRow(IconData icon, String title, String value, {Color color=AppColors.goldColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 12),
        Text(
          "$title:",
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
