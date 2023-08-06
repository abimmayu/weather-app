import 'package:weather_app/home/domain/entities/city.dart';
import 'package:weather_app/home/domain/entities/forecast.dart';

class ForecastModel {
  ForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  final String cod;
  final int message;
  final int cnt;
  final List<Forecast> list;
  final City city;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<Forecast>.from(
          json["list"].map(
            (x) => Forecast.fromJson(x),
          ),
        ),
        city: City.fromJson(
          json["city"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(
          list.map(
            (e) => e.toJson(),
          ),
        ),
        "city": city.toJson(),
      };
}
