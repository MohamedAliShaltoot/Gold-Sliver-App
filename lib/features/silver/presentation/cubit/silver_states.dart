import 'package:gold_salver_prices/features/silver/data/model/silver_model.dart';

abstract class SilverState {}
class SilverInitialState extends SilverState{}
class SilverLoadingState extends SilverState{}
class SilverSuccessState extends SilverState{
  final SilverModel silverData;
  SilverSuccessState(this.silverData);
}
class SilverErrorState extends SilverState{
  final String error;
  SilverErrorState(this.error);
}