import 'package:get_it/get_it.dart';
import 'package:weather_app/home/data/datasources/remote_data_source.dart';
import 'package:weather_app/home/data/repository/weather_repository_impl.dart';
import 'package:weather_app/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/home/page/bloc/home/home_bloc.dart';
import 'package:weather_app/home/page/bloc/listing%20weather/listing_weather_bloc.dart';

final locator = GetIt.instance;

void init() {
  //BLoC
  locator.registerFactory(
    () => WeatherBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ListingWeatherBloc(),
  );

  locator.registerLazySingleton(() => WeatherRepository);

  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(),
  );
}
