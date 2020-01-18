import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
        body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Mala Assistant",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize:24.0,
                  )
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
}
