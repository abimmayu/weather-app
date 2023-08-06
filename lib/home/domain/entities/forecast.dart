import 'package:weather_app/home/domain/entities/clouds_forecast.dart';
import 'package:weather_app/home/domain/entities/main_forecast.dart';
import 'package:weather_app/home/domain/entities/rain_forecast.dart';
import 'package:weather_app/home/domain/entities/sys_forecast.dart';
import 'package:weather_app/home/domain/entities/weather_forecast.dart';
import 'package:weather_app/home/domain/entities/wind_forecast.dart';

class Forecast {
  Forecast({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtText,
  });

  num dt;
  MainForecast? main;
  List<Weather> weather;
  Clouds? clouds;
  Wind? wind;
  num visibility;
  num pop;
  Rain? rain;
  Sys? sys;
  String dtText;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        dt: json["dt"],
        main: MainForecast.fromJson(
          json["main"],
        ),
        weather: List<Weather>.from(
          json["weather"].map(
            (x) => Weather.fromJson(x),
          ),
        ),
        clouds: Clouds.fromJson(
          json["clouds"],
        ),
        wind: Wind.fromJson(
          json["wind"],
        ),
        visibility: json["visibility"],
        pop: json["pop"],
        rain: json["rain"] != null
            ? Rain?.fromJson(
                json["rain"],
              )
            : null,
        sys: Sys.fromJson(
          json["sys"],
        ),
        dtText: json["dt_txt"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": List<dynamic>.from(
          weather.map(
            (e) => e.toJson(),
          ),
        ),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visbility": visibility,
        "pop": pop,
        "rain": rain?.toJson(),
        "sys": sys?.toJson(),
        "dt_txt": dtText,
      };
}
