import 'package:flutter/material.dart';
import 'package:mala_assistant/pages/splash.dart';
import 'package:mala_assistant/pages/home.dart';
import 'package:mala_assistant/pages/friends.dart';
import 'package:mala_assistant/pages/stores.dart';


void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/home': (context) => Home(),
      '/stores': (context) => Stores(),
      '/friends': (context) => Friends(),
//      '/meal': (context) => Meal(),
    }
));


