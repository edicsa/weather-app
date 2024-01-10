import 'package:clean_air/HomePage.dart';
import 'package:clean_air/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionScreen extends StatefulWidget {
  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
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
                Image(image: AssetImage('assets/icons/hand-wave.png')),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.permissionTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(
                    "Aplikacja ${Strings.appTitle} potrzebuje do działania\nprzybliżonej lokalizacji urządzenia.",
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
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(top: 12.0, bottom: 12.0))),
                  child: Text('Zgoda',
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  onPressed: () {
                    // todo ask about permissions
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
