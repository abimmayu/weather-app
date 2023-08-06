import 'package:weather_app/core/client/dio.dart';
import 'package:weather_app/core/client/endpoint.dart';
import 'package:weather_app/home/data/model/forecast_data_model.dart';

abstract class WeatherDataSource {
  Future<ForecastModel> getWeather({
    required String lat,
    required String lon,
  });
}

class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<ForecastModel> getWeather({
    required String lat,
    required String lon,
  }) async {
    final url = "${Endpoints.baseUrl}&lat=$lat&lon=$lon";
    final resp = await getIt(url);

    return ForecastModel.fromJson(
      resp.data,
    );
  }
}
