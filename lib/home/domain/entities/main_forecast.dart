class MainForecast {
  MainForecast({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num seaLevel;
  final num grndLevel;
  final num humidity;
  final num tempKf;

  factory MainForecast.fromJson(Map<String, dynamic> json) => MainForecast(
        temp: json['temp'],
        feelsLike: json["feels_like"],
        tempMin: json["temp_min"],
        tempMax: json["temp_max"],
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf
      };
}
