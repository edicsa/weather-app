import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';

class AirScreen extends StatefulWidget {
  AirScreen({required this.weather});

  final Weather weather;

  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
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
                      Color(0xff4acf8c),
                      Color(0xff75eda6),
                    ],
                    transform: GradientRotation(45))),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Jakosc powietrza",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                            color: Colors.black))),
                Padding(padding: EdgeInsets.only(top: 2.0)),
                Text("Bardzo dobra",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black))),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                CircleAvatar(
                  radius: 91.0,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "23",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 64.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                          Text(
                            "CAQI ⓘ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 28.0)),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("PM 2.5",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black))),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                                "${widget.weather.pressure?.floor().toString()} hPa",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 22.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 24,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("PM 10",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black))),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                                "${widget.weather.windSpeed?.floor().toString()} m/s",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 22.0,
                                        height: 1.2,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text("Stacja pomiarowa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                            color: Colors.black))),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Text("Warszawa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: Colors.black))),
                Padding(padding: EdgeInsets.only(bottom: 76))
              ],
            ),
          ),
          Positioned(
              left: 8,
              right: 0,
              top: 0,
              bottom: 45,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1,
                          child: Image.asset(
                            'assets/icons/danger-value-negative.png',
                            scale: .9,
                          ),
                        ),
                      ),
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1 - 0.4,
                          child: Image.asset(
                            'assets/icons/danger-value.png',
                            scale: .9,
                          ),
                        ),
                      )
                    ],
                  ))),
          Positioned(
              left: 8,
              right: 0,
              top: 0,
              bottom: 45,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 62.0, left: 10, right: 10, bottom: 14),
                        child: Divider(
                          height: 10,
                          color: Colors.black,
                          thickness: 1,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 24),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(),
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Text("dupa2")),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

bool havePermission() {
  return false;
}
