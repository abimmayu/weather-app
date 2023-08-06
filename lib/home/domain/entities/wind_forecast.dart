class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final num speed;
  final num deg;
  final num gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
        gust: json["gust"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
