import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/home/data/datasources/remote_data_source.dart';
import 'package:weather_app/home/data/model/forecast_data_model.dart';
import 'package:weather_app/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl({
    required this.weatherDataSource,
  });

  @override
  Future<Either<Failure, ForecastModel>> getWeather(
    String lat,
    String lon,
  ) async {
    try {
      final result = await weatherDataSource.getWeather(
        lat: lat,
        lon: lon,
      );
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 ||
          e.response?.statusCode == 401 ||
          e.response?.statusCode == 400) {
        return Left(
          WeatherFailure(
            message: e.response?.statusMessage,
          ),
        );
      } else {
        return Left(
          WeatherFailure(
            message: e.error.toString(),
          ),
        );
      }
    }
  }
}
