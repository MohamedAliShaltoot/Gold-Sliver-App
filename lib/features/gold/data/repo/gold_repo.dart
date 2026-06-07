import 'package:dartz/dartz.dart';
import 'package:gold_salver_prices/core/networking/api_constants.dart';
import 'package:gold_salver_prices/core/networking/dio_helper.dart';
import 'package:gold_salver_prices/features/gold/data/model/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGoldData() async {
 try {
  final res = await DioHelper.getData(endPoint: ApiConstants.goldEndpoint);
  final data = GoldModel.fromJson(res.data);

  return right(data);

} on Exception catch (e) {
 return left("Failed to fetch gold data: ${e.toString()}");
}
  }
}