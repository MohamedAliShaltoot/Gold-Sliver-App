import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_salver_prices/features/gold/data/repo/gold_repo.dart';
import 'package:gold_salver_prices/features/gold/presentation/cubit/gold_states.dart';

class GoldCubit extends Cubit<GoldState> {
  GoldCubit(this.goldRepo) : super(GoldInitialState());
  static GoldCubit get(context) => BlocProvider.of(context);
  final GoldRepo goldRepo;
  Future<void> fetchGoldData() async {
    emit(GoldLoadingState());
    final result = await goldRepo.getGoldData();
    result.fold(
      (error) => emit(GoldErrorState(error)),
      (goldData) => emit(GoldSuccessState(goldData)),
    );
  }
}