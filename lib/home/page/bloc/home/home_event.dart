part of "home_bloc.dart";

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object> get props => [];
}

@immutable
class WeatherGetEvent extends WeatherEvent {
  final String lat;
  final String lon;

  const WeatherGetEvent(
    this.lat,
    this.lon,
  );

  @override
  List<Object> get props => [];
}
