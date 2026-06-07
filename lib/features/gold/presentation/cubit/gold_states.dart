import 'package:gold_salver_prices/features/gold/data/model/gold_model.dart';

abstract class GoldState {}
class GoldInitialState extends GoldState{}
class GoldLoadingState extends GoldState{}
class GoldSuccessState extends GoldState{
  final GoldModel goldData;
  GoldSuccessState(this.goldData);
}
class GoldErrorState extends GoldState{
  final String error;
  GoldErrorState(this.error);
}