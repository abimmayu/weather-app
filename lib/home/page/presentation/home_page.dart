import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/common/common.dart';
import 'package:weather_app/home/page/widget/app_bar_icon.dart';
import 'package:weather_app/home/page/widget/background_container.dart';
import 'package:weather_app/home/page/widget/button_chosen_day.dart';
import 'package:weather_app/home/page/widget/card_weather_per_hour.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fontSizeUpper = ScreenUtil().setWidth(12);
  double fontSizeBottom = ScreenUtil().setWidth(16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundContainer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setHeight(16),
                vertical: ScreenUtil().setWidth(16),
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBarIcon(
                          icon: Icons.location_on,
                          onTap: () {},
                        ),
                        OriginTextStyle().boldTextStyle(
                          text: 'Bekasi, Indonesia',
                          color: Colors.white,
                          fontSize: ScreenUtil().setWidth(16),
                        ),
                        AppBarIcon(
                          icon: Icons.search,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: ScreenUtil().setHeight(148),
                          width: ScreenUtil().setWidth(148),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://openweathermap.org/img/wn/10d@4x.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OriginTextStyle().normalTextStyle(
                              text: 'Rain',
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
                              text: '30°/ 23°',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            OriginTextStyle().normalTextStyle(
                              text: 'AQI 24',
                              padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(8),
                              ),
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OriginTextStyle().normalTextStyle(
                              padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(14),
                                left: ScreenUtil().setWidth(24),
                              ),
                              text: '29°',
                              color: Colors.white,
                              fontSize: ScreenUtil().setWidth(56),
                            ),
                            OriginTextStyle().normalTextStyle(
                              text: 'Tue, 4 January',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonChosenDay(
                        onTap: () {},
                        width: ScreenUtil().setWidth(100),
                        child: OriginTextStyle().normalTextStyle(
                          padding: EdgeInsets.all(
                            ScreenUtil().setWidth(8),
                          ),
                          text: 'Today',
                          color: Colors.white,
                          fontSize: ScreenUtil().setWidth(16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ButtonChosenDay(
                        onTap: () {},
                        width: ScreenUtil().setWidth(100),
                        child: OriginTextStyle().normalTextStyle(
                          padding: EdgeInsets.all(
                            ScreenUtil().setWidth(8),
                          ),
                          text: 'Tomorrow',
                          color: Colors.white,
                          fontSize: ScreenUtil().setWidth(16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(0),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CardWeatherperHour(
                          height: ScreenUtil().setHeight(10),
                          upperText: '00:00',
                          upperTextColor: ColorPalatte().primaryColor,
                          image: 'https://openweathermap.org/img/wn/10d@2x.png',
                          bottomText: '27°',
                          bottomTextColor: ColorPalatte().primaryColor,
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      ScreenUtil().setHeight(16),
                    ),
                    decoration: BoxDecoration(
                      color: ColorPalatte().primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(30),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                      ),
                                      text: 'Humidity',
                                      color: ColorPalatte().greyColor!,
                                      fontSize: fontSizeUpper,
                                    ),
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.zero,
                                      text: '20%',
                                      color: ColorPalatte().primaryColor,
                                      fontSize: fontSizeBottom,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(10),
                                    ),
                                    text: 'Wind Speed',
                                    color: ColorPalatte().greyColor!,
                                    fontSize: fontSizeUpper,
                                  ),
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.zero,
                                    text: '5.6km/h',
                                    color: ColorPalatte().primaryColor,
                                    fontSize: fontSizeBottom,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(30),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                      ),
                                      text: 'Pressure',
                                      color: ColorPalatte().greyColor!,
                                      fontSize: fontSizeUpper,
                                    ),
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.zero,
                                      text: '1026mbar',
                                      color: ColorPalatte().primaryColor,
                                      fontSize: fontSizeBottom,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(10),
                                    ),
                                    text: 'UV Index',
                                    color: ColorPalatte().greyColor!,
                                    fontSize: fontSizeUpper,
                                  ),
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.zero,
                                    text: '0',
                                    color: ColorPalatte().primaryColor,
                                    fontSize: fontSizeBottom,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(30),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                      ),
                                      text: 'Real feel',
                                      color: ColorPalatte().greyColor!,
                                      fontSize: fontSizeUpper,
                                    ),
                                    OriginTextStyle().normalTextStyle(
                                      padding: EdgeInsets.zero,
                                      text: '27°',
                                      color: ColorPalatte().primaryColor,
                                      fontSize: fontSizeBottom,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(10),
                                    ),
                                    text: 'Chance of Rain',
                                    color: ColorPalatte().greyColor!,
                                    fontSize: fontSizeUpper,
                                  ),
                                  OriginTextStyle().normalTextStyle(
                                    padding: EdgeInsets.zero,
                                    text: '7%',
                                    color: ColorPalatte().primaryColor,
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
      ),
    );
  }
}
