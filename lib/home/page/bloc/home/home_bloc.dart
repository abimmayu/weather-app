import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/home/data/model/forecast_data_model.dart';
import 'package:weather_app/home/domain/repositories/weather_repository.dart';

part "home_event.dart";
part "home_state.dart";

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(
    this.weatherRepository,
  ) : super(
          WeatherEmpty(),
        ) {
    on<WeatherGetEvent>(
      (event, emit) async {
        emit(
          WeatherLoading(),
        );
        final result = await weatherRepository.getWeather(
          event.lat,
          event.lon,
        );

        result.fold(
          (l) => emit(
            WeatherError(l.message!),
          ),
          (r) => emit(
            WeatherLoaded(r),
          ),
        );
      },
    );
  }
}
