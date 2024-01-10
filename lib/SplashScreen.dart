import 'dart:developer';

import 'package:clean_air/HomePage.dart';
import 'package:clean_air/PermissionScreen.dart';
import 'package:clean_air/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xff6671e5),
                      Color(0xff4852d9),
                    ],
                    transform: GradientRotation(45))),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/icons/cloud-sun.png')),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 42.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Aplikacja do monitorowania \n czystości powietrza.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white)))
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 45,
              child: Container(
                alignment: Alignment.center,
                child: Text("Przywiewam dane... ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white))),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (havePermission() == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  bool havePermission() {
    return true;
  }

  void executeOnceAfterBuild() async {
    WeatherFactory wf = new WeatherFactory("6b39b131838ad46b622e872e47becbde",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName("Oswiecim");

    log(w.toJson().toString());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(weather: w)));
  }
}
