import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "listing_weather_event.dart";
part "listing_weather_state.dart";

class ListingWeatherBloc
    extends Bloc<ListingWeatherEvent, ListingWeatherState> {
  ListingWeatherBloc()
      : super(
          ListingWeatherToday(),
        ) {
    on<ListingWeatherEvent>(
      (event, emit) {
        if (state is ListingWeatherToday) {
          emit(ListingWeatherLoading());
          emit(
            ListingWeatherTomorrow(),
          );
        } else if (state is ListingWeatherTomorrow) {
          emit(ListingWeatherLoading());
          emit(
            ListingWeatherToday(),
          );
        }
      },
    );
  }
}
