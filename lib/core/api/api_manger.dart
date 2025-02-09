import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'end_points.dart';

part 'api_manger.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class NewApiManger {
  @factoryMethod
  factory NewApiManger(Dio dio) = _NewApiManger;

// @POST(EndPoints.login)
// Future<String> login(@Body() Map<String, dynamic> data);
}
