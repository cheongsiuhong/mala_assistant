import 'package:flutter/material.dart';
import 'package:mala_assistant/store/ingredient.dart';
import 'package:mala_assistant/store/store.dart';

class StorePage extends StatelessWidget {
  final Store store;

  StorePage({this.store});

  @override
  Widget build(BuildContext context) {
    Card makeCard(Ingredient ingredient) {
      return Card(
          child: ListTile(
              title: Text(ingredient.name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(ingredient.type.toString().split(".")[1]),
                  Text(ingredient.price.toStringAsFixed(2) + " per portion")
                ],
              )));
    }

    final makeIngredientList = Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: store.ingredients.length,
      itemBuilder: (BuildContext context, int index) {
        return makeCard(store.ingredients[index]);
      },
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(store.name),
        backgroundColor: Colors.redAccent,
      ),
      body: makeIngredientList,
    );
  }
}
