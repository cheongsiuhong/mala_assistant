import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Mala Assistant",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize:36.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(
                  height: 8.0,
                ),
                SpinKitThreeBounce(
                  color: Colors.white,
                  size: 50.0,
                ),
              ],
            )
        )
    );
  }

  void redirect() async {
    await Future.delayed(const Duration(seconds:2));
    Navigator.pushReplacementNamed(context, '/home');
  }
}
