import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';
import 'package:gold_salver_prices/core/constants/app_images.dart';
import 'package:gold_salver_prices/core/constants/app_strings.dart';
import 'package:gold_salver_prices/core/widgets/customCircularProgressIndicator.dart';
import 'package:gold_salver_prices/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:gold_salver_prices/features/gold/presentation/cubit/gold_states.dart';
import 'package:gold_salver_prices/core/widgets/buildInfoRow.dart';
import 'package:gold_salver_prices/features/silver/data/repo/silver_repo.dart';
import 'package:gold_salver_prices/features/silver/presentation/cubit/silver_cubit.dart';
import 'package:gold_salver_prices/features/silver/presentation/cubit/silver_states.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..fetchSilverData(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            AppStrings.silverTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.silverColor,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return customCircularProgressIndicator(
                color: AppColors.silverColor,
              );
            } else if (state is SilverSuccessState) {
              final silverData = state.silverData;
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.silverImage, height: 140),
                        const SizedBox(height: 25),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.silverColor,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.goldColor.withOpacity(0.2),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Silver Information",
                                style: TextStyle(
                                  color: AppColors.silverColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Divider(
                                color: AppColors.silverColor,
                                height: 30,
                              ),

                              buildInfoRow(
                                Icons.attach_money,
                                "Price",
                                "${silverData.price} ${silverData.currency}",
                                color: AppColors.silverColor,
                              ),

                              buildInfoRow(
                                Icons.account_balance,
                                "Name",
                                silverData.name,
                                color: AppColors.silverColor,
                              ),

                              buildInfoRow(
                                Icons.tag,
                                "Symbol",
                                silverData.symbol,
                                color: AppColors.silverColor,
                              ),

                              buildInfoRow(
                                Icons.calendar_today,
                                "Updated At",
                                silverData.updatedAt.substring(0, 10),
                                color: AppColors.silverColor,
                              ),

                              buildInfoRow(
                                Icons.access_time,
                                "Readable Date",
                                silverData.updatedAtReadable,
                                color: AppColors.silverColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SilverErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
