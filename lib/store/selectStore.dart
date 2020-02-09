import 'package:flutter/material.dart';
import 'package:mala_assistant/store/store.dart';

class SelectStore extends StatelessWidget {
  final List<Store> stores;

  SelectStore({this.stores});

  @override
  Widget build(BuildContext context) {
    final makeStoreList = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stores.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(context, stores[index]);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Store"),
        backgroundColor: Colors.red,
      ),
      body: makeStoreList,
    );
  }

  Card makeCard(BuildContext context, Store store) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: ListTile(
      title: Text(store.name),
      onTap: () {
        Navigator.pop(context, store);
      },
    ),
  );
}
