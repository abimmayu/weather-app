import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/home/page/bloc/home/home_bloc.dart';
import 'package:weather_app/home/page/bloc/listing%20weather/listing_weather_bloc.dart';
import 'package:weather_app/injection.dart' as di;
import 'package:weather_app/splash_screen.dart';

void main() {
  di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<WeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ListingWeatherBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }
}
