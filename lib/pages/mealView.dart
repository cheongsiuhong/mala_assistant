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
  List<Friend> selectedFriends;

  @override
  void initState() {
    this.stores = widget.stores;
    this.friends = widget.friends;
    super.initState();
    new Future.delayed(Duration.zero, () async {
      store = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectStore(stores: stores)));
    }).whenComplete(() async {
      selectedFriends = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectFriends(friends: friends)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Order Meal'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
      ),
      body: Row(
        children: <Widget>[
          Text(
            "Eating with ${selectedFriends.map((Friend friend) => friend.name).join(", ")}\n at ${store.name}"
          )
        ],
      )
    );
  }
}
