import 'package:dartz/dartz.dart';
import 'package:gold_salver_prices/core/networking/api_constants.dart';
import 'package:gold_salver_prices/core/networking/dio_helper.dart';
import 'package:gold_salver_prices/features/silver/data/model/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilverData() async {
 try {
  final res = await DioHelper.getData(endPoint: ApiConstants.silverEndpoint);
  final data = SilverModel.fromJson(res.data);

  return right(data);

} on Exception catch (e) {
 return left("Failed to fetch silver data: ${e.toString()}");
}
  }
}