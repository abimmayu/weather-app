import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/common/common.dart';
import 'package:weather_app/home/page/bloc/home/home_bloc.dart';
import 'package:weather_app/home/page/widget/app_bar_icon.dart';
import 'package:weather_app/home/page/widget/background_container.dart';
import 'package:weather_app/home/page/widget/card_weather_per_hour.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    this.position,
  });

  Position? position;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fontSizeUpper = ScreenUtil().setWidth(12);
  double fontSizeBottom = ScreenUtil().setWidth(16);

  Color todayColor = Colors.white;
  Color tomorrowColor = Colors.transparent;

  @override
  void initState() {
    context.read<WeatherBloc>().add(
          WeatherGetEvent(
              "${widget.position?.latitude}", "${widget.position?.longitude}"),
        );
    super.initState();
  }

  String? currentAddress;
  Position? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundContainer(),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherLoaded) {
                final result = state.forecastModel;
                final DateTime date = DateTime.parse(result.list[0].dtText);
                final dayFormat = DateFormat('EE, d MMMM');
                final allFormat = DateFormat('EE, d MMM hh:mm');

                return SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(16),
                          vertical: ScreenUtil().setWidth(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppBarIcon(
                                    icon: Icons.location_on,
                                    onTap: () {
                                      _handleLocationPermission()
                                          .then(
                                            (value) => _getCurrentPosition(),
                                          )
                                          .then(
                                            (value) =>
                                                context.read<WeatherBloc>().add(
                                                      WeatherGetEvent(
                                                          "${position?.latitude}",
                                                          "${position?.longitude}"),
                                                    ),
                                          );
                                    },
                                  ),
                                  OriginTextStyle().boldTextStyle(
                                    text: result.city.name,
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setWidth(24),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(24),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                color: ColorPalatte()
                                    .primaryColor
                                    .withOpacity(0.3),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: ScreenUtil().setHeight(148),
                                    width: ScreenUtil().setWidth(148),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://openweathermap.org/img/wn/${result.list[0].weather[0].icon}@4x.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OriginTextStyle().normalTextStyle(
                                        text: result.list[0].weather[0].main,
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(8),
                                        ),
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      OriginTextStyle().normalTextStyle(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(8),
                                        ),
                                        text:
                                            '${result.list[0].main?.tempMax.round()}°/ ${result.list[0].main?.tempMin.round()}°',
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OriginTextStyle().normalTextStyle(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(14),
                                          left: ScreenUtil().setWidth(24),
                                        ),
                                        text:
                                            '${result.list[0].main?.temp.round()}°',
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setWidth(56),
                                      ),
                                      OriginTextStyle().normalTextStyle(
                                        text: dayFormat.format(date),
                                        padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(24),
                                        ),
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setWidth(12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(24),
                            ),
                            OriginTextStyle().boldTextStyle(
                              text: 'Forecast for the next 5 days!',
                              color: ColorPalatte().primaryColor,
                              fontSize: ScreenUtil().setWidth(12),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: result.list.length,
                                itemBuilder: (context, index) {
                                  final DateTime dateList =
                                      DateTime.parse(result.list[index].dtText);
                                  return CardWeatherperHour(
                                    height: ScreenUtil().setHeight(10),
                                    upperText: allFormat.format(dateList),
                                    upperTextColor: ColorPalatte().primaryColor,
                                    image:
                                        'https://openweathermap.org/img/wn/${result.list[index].weather[0].icon}@2x.png',
                                    bottomText:
                                        '${result.list[index].main?.temp.round()}°',
                                    bottomTextColor:
                                        ColorPalatte().primaryColor,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                ScreenUtil().setHeight(16),
                              ),
                              decoration: BoxDecoration(
                                color: ColorPalatte()
                                    .primaryColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: ScreenUtil().setHeight(30),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                text: 'Humidity',
                                                color: ColorPalatte()
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontSize: fontSizeUpper,
                                              ),
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.zero,
                                                text:
                                                    '${result.list[0].main?.humidity}%',
                                                color:
                                                    ColorPalatte().primaryColor,
                                                fontSize: fontSizeBottom,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    ScreenUtil().setHeight(10),
                                              ),
                                              text: 'Wind Speed',
                                              color: ColorPalatte()
                                                  .primaryColor
                                                  .withOpacity(0.5),
                                              fontSize: fontSizeUpper,
                                            ),
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.zero,
                                              text:
                                                  '${result.list[0].wind?.speed}km/h',
                                              color:
                                                  ColorPalatte().primaryColor,
                                              fontSize: fontSizeBottom,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: ScreenUtil().setHeight(30),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                text: 'Pressure',
                                                color: ColorPalatte()
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontSize: fontSizeUpper,
                                              ),
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.zero,
                                                text:
                                                    '${result.list[0].main?.pressure}mbar',
                                                color:
                                                    ColorPalatte().primaryColor,
                                                fontSize: fontSizeBottom,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    ScreenUtil().setHeight(10),
                                              ),
                                              text: 'P.O.P',
                                              color: ColorPalatte()
                                                  .primaryColor
                                                  .withOpacity(0.5),
                                              fontSize: fontSizeUpper,
                                            ),
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.zero,
                                              text:
                                                  '${result.list[0].pop * 100}%',
                                              color:
                                                  ColorPalatte().primaryColor,
                                              fontSize: fontSizeBottom,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: ScreenUtil().setHeight(30),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                text: 'Real feel',
                                                color: ColorPalatte()
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontSize: fontSizeUpper,
                                              ),
                                              OriginTextStyle().normalTextStyle(
                                                padding: EdgeInsets.zero,
                                                text:
                                                    '${result.list[0].main?.feelsLike.round()}°',
                                                color:
                                                    ColorPalatte().primaryColor,
                                                fontSize: fontSizeBottom,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    ScreenUtil().setHeight(10),
                                              ),
                                              text: 'Rain Volume',
                                              color: ColorPalatte()
                                                  .primaryColor
                                                  .withOpacity(0.5),
                                              fontSize: fontSizeUpper,
                                            ),
                                            OriginTextStyle().normalTextStyle(
                                              padding: EdgeInsets.zero,
                                              text: result.list[0].rain != null
                                                  ? '${result.list[0].rain?.h3}mm'
                                                  : '-',
                                              color:
                                                  ColorPalatte().primaryColor,
                                              fontSize: fontSizeBottom,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(24),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppBarIcon(
                          height: ScreenUtil().setWidth(56),
                          width: ScreenUtil().setWidth(56),
                          icon: Icons.location_on,
                          onTap: () {
                            _handleLocationPermission()
                                .then(
                                  (value) => _getCurrentPosition(),
                                )
                                .then(
                                  (value) => context.read<WeatherBloc>().add(
                                        WeatherGetEvent("${position?.latitude}",
                                            "${position?.longitude}"),
                                      ),
                                );
                          },
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(24),
                        ),
                        OriginTextStyle().boldTextStyle(
                          text: 'Press this Button to get your Weather Data!',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then(
      (Position position) {
        context.read<WeatherBloc>().add(
              WeatherGetEvent("${position.latitude}", "${position.longitude}"),
            );
      },
    ).catchError(
      (e) {
        debugPrint(e);
      },
    );
  }
}
