import 'package:flutter/material.dart';
import 'package:mala_assistant/pages/splash.dart';
import 'package:mala_assistant/pages/home.dart';
import 'package:mala_assistant/pages/friendsPage.dart';
import 'package:mala_assistant/pages/selectStore.dart';
import 'package:mala_assistant/pages/stores.dart';
import 'package:mala_assistant/store/store.dart';
import 'package:mala_assistant/store/defaultStore.dart';

List<Store> stores = [new DefaultStore()];

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Splash(),
      '/home': (context) => Home(),
      '/stores': (context) => Stores(stores: stores),
      '/friends': (context) => Friends(),
      '/meal': (context) => SelectStore(stores: stores),
    }));
