abstract class Failure implements Exception {
  String? title;
  String? message;
  Failure({
    this.title,
    this.message,
  });
}

class WeatherFailure extends Failure {
  WeatherFailure({
    String? message,
  }) : super(
          title: 'Get Weather Failure',
          message: message,
        );
}

class LocationFailure extends Failure {
  LocationFailure({
    String? message,
  }) : super(
          title: 'Get Location Failure',
          message: message,
        );
}
