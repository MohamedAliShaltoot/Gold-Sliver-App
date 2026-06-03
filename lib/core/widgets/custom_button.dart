import 'package:flutter/material.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed, required this.btnBackgroundColor});
  final String text ;
  final void Function()? onPressed;
  final Color btnBackgroundColor;
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width *0.7,
        height: 50,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: btnBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(text
          ,style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 19,
            fontWeight: FontWeight.w600
          ),
          ),
        ),
      ),
    );
  }

}