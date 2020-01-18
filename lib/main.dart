import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/home': (context) => Home(),
      '/stores': (context) => Stores(),
      '/friends': (context) => Friends(),
      '/meal': (context) => Meal(),
    }
));


