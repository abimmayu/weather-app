part of "home_bloc.dart";

abstract class WeatherState extends Equatable {}

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final ForecastModel forecastModel;
  WeatherLoaded(
    this.forecastModel,
  );

  @override
  List<Object> get props => forecastModel.list;
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(
    this.message,
  );

  @override
  List<Object> get props => [message];
}
