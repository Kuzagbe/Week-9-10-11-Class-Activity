import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:login_authentication/Setup/login.dart';
import 'package:login_authentication/Pages/home.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return false;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => Home()
        )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              SizedBox(
                child: new Opacity(
                  opacity: 1,
                  child: Image.asset('assets/images/xris.jpg',
                      fit: BoxFit.cover,
                      color: Color.fromRGBO(255, 255, 255, 0.0),
                      colorBlendMode: BlendMode.luminosity),
                ),
                height: 20000.0,
              ),
              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xff7f00ff),
                highlightColor: Color(0xffe100ff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Xris-Studio",
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
