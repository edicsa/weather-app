import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({required this.weather});

  final Weather weather;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                gradient: getGradientByMood(widget.weather)),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 45.0)),
                Image(
                  image: AssetImage(
                      'assets/icons/${getIconByMood(widget.weather)}.png'),
                  width: 180,
                  height: 180,
                ),
                Padding(padding: EdgeInsets.only(top: 41.0)),
                Text(
                    "${DateFormat.MMMMEEEEd('pl').format(DateTime.now())}, ${widget.weather.weatherDescription}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.8,
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                    "${widget.weather.temperature?.celsius?.floor().toString()}°C",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 64.0,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Text(
                    "Odczuwalna ${widget.weather.tempFeelsLike?.celsius?.floor().toString()}°C",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Padding(padding: EdgeInsets.only(top: 25.0)),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Cisnienie:",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white))),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                                "${widget.weather.pressure?.floor().toString()} hPa",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 48,
                        thickness: 1,
                        color: Colors.white,
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Wiatr:",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white))),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                                "${widget.weather.windSpeed?.floor().toString()} m/s",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                if (widget.weather.rainLastHour != null)
                  Text("Opady ${widget.weather.rainLastHour} mm/1h",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14.0,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                Padding(padding: EdgeInsets.only(top: 68.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient getGradientByMood(Weather weather) {
    var main = weather.weatherMain;

    log(main.toString() +
        " | " +
        weather.date!.toLocal().toString() +
        " | " +
        weather.sunset!.toLocal().toString());

    if ((main == "Clouds" || main == "Drizzle" || main == "Snow") &&
        isNight(weather) == false)
      return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff6e6cd8),
            Color(0xff77e1ee),
          ]);
    else if (main == "Thunderstore" || isNight(weather))
      return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff313545),
            Color(0xff211118),
          ]);
    else
      return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff5283f0),
            Color(0xffcdedd4),
          ]);
  }

  String getIconByMood(Weather weather) {
    var main = weather.weatherMain;

    if (main == "Clouds" || main == "Drizzle" || main == "Snow")
      return 'weather-rain';
    else if (main == "Thunderstore")
      return 'weather-lighting';
    else if (isNight(weather))
      return 'weather-moonny';
    else
      return 'weather-sunny';
  }

  bool isNight(Weather weather) {
    return DateTime.now().isAfter(weather.sunset!.toLocal()) ||
        DateTime.now().isBefore(weather.sunrise!.toLocal());
  }
}
