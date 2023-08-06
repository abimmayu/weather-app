class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  num lat;
  num lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
