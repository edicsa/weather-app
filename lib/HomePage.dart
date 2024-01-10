import 'package:clean_air/AirScreen.dart';
import 'package:clean_air/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather/weather.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.weather});

  final Weather weather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 1;
  var _screens;

  @override
  void initState() {
    initializeDateFormatting();

    _screens = [
      AirScreen(weather: widget.weather),
      WeatherScreen(weather: widget.weather)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 38,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/house.png'),
              label: "Pogoda",
              activeIcon: Image.asset('assets/icons/house-checked.png')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/cloud.png'),
              label: "Powietrze",
              activeIcon: Image.asset('assets/icons/cloud-checked.png')),
        ],
      ),
    );
  }
}
