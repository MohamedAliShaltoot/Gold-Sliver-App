import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_salver_prices/features/silver/data/repo/silver_repo.dart';
import 'package:gold_salver_prices/features/silver/presentation/cubit/silver_states.dart';

class SilverCubit extends Cubit<SilverState> {
  SilverCubit(this.silverRepo) : super(SilverInitialState());
  static SilverCubit get(context) => BlocProvider.of(context);
  final SilverRepo silverRepo;
  Future<void> fetchSilverData() async {
    emit(SilverLoadingState());
    final result = await silverRepo.getSilverData();
    result.fold(
      (error) => emit(SilverErrorState(error)),
      (silverData) => emit(SilverSuccessState(silverData)),
    );
  }
}