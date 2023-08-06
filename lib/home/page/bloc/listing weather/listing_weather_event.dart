part of "listing_weather_bloc.dart";

abstract class ListingWeatherEvent extends Equatable {
  const ListingWeatherEvent();
  @override
  List<Object> get props => [];
}

@immutable
class ListingWeatherChange extends ListingWeatherEvent {}
