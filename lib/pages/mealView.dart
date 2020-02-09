import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';
import 'package:mala_assistant/friends/selectFriends.dart';
import 'package:mala_assistant/store/selectStore.dart';
import 'package:mala_assistant/store/store.dart';

class MealView extends StatefulWidget {
  final List<Store> stores;
  final List<Friend> friends;

  MealView({this.stores, this.friends});

  @override
  _MealViewState createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  List<Store> stores;
  List<Friend> friends;
  Store store;

  @override
  void initState() {
    this.stores = widget.stores;
    this.friends = widget.friends;
    super.initState();
    new Future.delayed(Duration.zero, () async {
      store = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectStore(stores: stores)));
    }).whenComplete(() async {
      store = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectFriends(friends: friends)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
