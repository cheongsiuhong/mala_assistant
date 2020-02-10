import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';
import 'package:mala_assistant/pages/splashView.dart';
import 'package:mala_assistant/pages/homeView.dart';
import 'package:mala_assistant/pages/friendsView.dart';
import 'package:mala_assistant/pages/mealView.dart';
import 'package:mala_assistant/pages/storesView.dart';
import 'package:mala_assistant/store/store.dart';

final List<Store> stores = Store.defaultStores;
final List<Friend> friends = Friend.defaultFriends;

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => SplashView(),
      '/home': (context) => HomeView(),
      '/stores': (context) => StoresView(stores: stores),
      '/friends': (context) => FriendsView(friends: friends),
      '/meal': (context) => MealView(stores: stores, friends: friends),
    }));
