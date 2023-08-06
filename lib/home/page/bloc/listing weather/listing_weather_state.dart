part of "listing_weather_bloc.dart";

abstract class ListingWeatherState extends Equatable {}

class ListingWeatherToday extends ListingWeatherState {
  @override
  List<Object> get props => [];
}

class ListingWeatherTomorrow extends ListingWeatherState {
  @override
  List<Object> get props => [];
}

class ListingWeatherLoading extends ListingWeatherState {
  @override
  List<Object> get props => [];
}
