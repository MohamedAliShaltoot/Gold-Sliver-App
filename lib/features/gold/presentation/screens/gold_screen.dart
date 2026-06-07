import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_salver_prices/core/constants/app_colors.dart';
import 'package:gold_salver_prices/core/constants/app_images.dart';
import 'package:gold_salver_prices/core/constants/app_strings.dart';
import 'package:gold_salver_prices/core/widgets/customCircularProgressIndicator.dart';
import 'package:gold_salver_prices/features/gold/data/repo/gold_repo.dart';
import 'package:gold_salver_prices/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:gold_salver_prices/features/gold/presentation/cubit/gold_states.dart';
import 'package:gold_salver_prices/core/widgets/buildInfoRow.dart';
import 'package:gold_salver_prices/features/gold/presentation/screens/widgets/custom_text.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..fetchGoldData(),
      child: Scaffold(
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
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return customCircularProgressIndicator();
            } else if (state is GoldSuccessState) {
              final goldData = state.goldData;
             return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.goldImage, height: 140),
                        const SizedBox(height: 25),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.goldColor,
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
                                "Gold Information",
                                style: TextStyle(
                                  color: AppColors.goldColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Divider(
                                color: AppColors.goldColor,
                                height: 30,
                              ),

                              buildInfoRow(
                                Icons.attach_money,
                                "Price",
                                "${goldData.price} ${goldData.currency}",
                              ),

                              buildInfoRow(
                                Icons.account_balance,
                                "Name",
                                goldData.name,
                              ),

                              buildInfoRow(
                                Icons.tag,
                                "Symbol",
                                goldData.symbol,
                              ),

                              buildInfoRow(
                                Icons.calendar_today,
                                "Updated At",
                                goldData.updatedAt.substring(0, 10),
                              ),

                              buildInfoRow(
                                Icons.access_time,
                                "Readable Date",
                                goldData.updatedAtReadable,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GoldErrorState) {
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

