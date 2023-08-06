import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/home/data/model/forecast_data_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, ForecastModel>> getWeather(
    String lat,
    String lon,
  );
}
