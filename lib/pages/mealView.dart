import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';
import 'package:mala_assistant/friends/selectFriends.dart';
import 'package:mala_assistant/store/ingredient.dart';
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

  List<int> ingredientQty;

  double price;
  double budget;

  int spice;
  int targetSpice;

  int appetite;
  int targetAppetite;

  @override
  void initState() {
    this.stores = widget.stores;
    this.friends = widget.friends;
    this.price = 0.0;
    this.spice = 1;
    this.appetite = 0;
    super.initState();
  }

  void setStore(Store store) {
    setState(() => this.store = store);
  }

  void setSelectedFriends(List<Friend> selectedFriends) {
    setState(() => this.selectedFriends = selectedFriends);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedFriends == null) {
      return SelectFriends(
          friends: friends, setSelectedFriends: setSelectedFriends);
    }

    if (store == null) {
      return SelectStore(stores: stores, setStore: setStore);
    }

    ingredientQty =
        new List<int>.filled(store.ingredients.length, 0, growable: false);
    targetSpice =
        selectedFriends.map((f) => f.spiceLevel).reduce((a, b) => min(a, b));
    budget = selectedFriends.map((f) => f.budget).reduce((a, b) => a + b);
    targetAppetite =
        selectedFriends.map((f) => f.appetite).reduce((a, b) => a + b);

    return Scaffold(
        appBar: new AppBar(
          title: Text('Order Meal'),
          backgroundColor: Colors.red,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(flex: 1, child: topInfoDisplay()),
            Expanded(flex: 5, child: orderSheet()),
          ],
        ));
  }

  Widget topInfoDisplay() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Center(
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "${store.name}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      fontSize: 32.0),
                ),
              ),
              SizedBox(height: 5.0),
              Text("with",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black87)),
              SizedBox(height: 5.0),
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                      "${selectedFriends.map((Friend friend) => friend.name).toList().join(", ")}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14.0)))
            ],
          ),
        ),
        Divider(
          height: 18.0,
          color: Colors.black54,
        )
      ],
    );
  }

  Widget orderSheet() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ListTile(
            title: Text("Spice Level"),
            trailing: DropdownButton<String>(
              value: Friend.spiceList[this.spice - 1],
              items: Friend.spiceList.map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (String val) {
                setState(() {
                  this.spice = Friend.spiceList.indexOf(val) + 1;
                });
              },
              elevation: 12,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(height: 1.0),
        ),
        Expanded(
          flex: 36,
          child: Container(
            color: Colors.red[50],
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: store.ingredients.length,
              itemBuilder: (context, index) {
                return IngredientItem(
                    ingredient: store.ingredients[index],
                    index: index,
                    changeQty: changeQty);
              },
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: budgetInfo(),
        ),
        Expanded(
            flex: 4,
            child: new Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  color: Colors.red[800],
                  child: const Text(
                    'Get Feedback',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("About your meal"),
                          content: getFeedback(),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Go back")),
                            new FlatButton(
                                onPressed: () {
                                  Navigator.of(context).popUntil(ModalRoute.withName('/home'));
                                },
                                child: Text("Done ordering")),
                          ],
                        ),
                        barrierDismissible: true);
                  },
                )))
      ],
    );
  }

  Widget budgetInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Budget: \$" + budget.toStringAsFixed(2),
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
        Text(
          "Current: \$" + price.toStringAsFixed(2),
          style: TextStyle(
              fontSize: 16.0,
              color: price > budget ? Colors.red : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget getFeedback() {
    bool overBudget = this.price > this.budget;
    bool tooSpicy = this.spice > this.targetSpice;
    bool notSpicy = this.spice < this.targetSpice;
    bool tooMuch = this.appetite > this.targetAppetite * 2 + 1;
    bool tooLittle = this.appetite < this.targetAppetite * 1.5;

    String msg = "";

    if (overBudget) msg += "Currently over budget!\n";
    if (tooSpicy) msg += "It's too spicy!\n";
    if (notSpicy) msg += "Could be more spicy.\n";
    if (tooMuch) msg += "That's too much food!\n";
    if (tooLittle) msg += "That's too little food\n";

    if (msg.isEmpty) msg = "Looks good!\n";

    return Text(msg);
  }

  void changeQty(int index, bool increment) {
    setState(() {
      ingredientQty[index] =
          increment ? ingredientQty[index] + 1 : ingredientQty[index] - 1;
      this.price = increment
          ? this.price + store.ingredients[index].price
          : this.price - store.ingredients[index].price;
      this.appetite = increment ? this.appetite + 1 : this.appetite - 1;
    });
  }
}

class IngredientItem extends StatefulWidget {
  final Ingredient ingredient;
  final int index;
  final Function(int, bool) changeQty;

  IngredientItem({this.ingredient, this.index, this.changeQty});

  @override
  _IngredientItemState createState() => new _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.ingredient.name),
      subtitle:
          Text(widget.ingredient.price.toStringAsFixed(2) + " per portion"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _itemCount != 0
              ? IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => setState(() {
                    _itemCount--;
                    widget.changeQty(widget.index, false);
                  }),
                )
              : Container(),
          Text(_itemCount.toString()),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                    _itemCount++;
                    widget.changeQty(widget.index, true);
                  }))
        ],
      ),
    );
  }
}
