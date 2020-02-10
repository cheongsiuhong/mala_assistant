import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Mala Assistant")
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/friends');
            },
            child: nameToCard("Friends", Icon(Icons.person)),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/stores');
            },
            child: nameToCard("Stores", Icon(Icons.restaurant)),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/meal');
            },
            child: nameToCard("New Meal", Icon(Icons.fastfood)),
          ),
        ],
      )
    );
  }

  Card nameToCard(String name, Icon icon) {
    return new Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: ListTile(
                leading: icon,
                title:Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
              )
          ),
        ),
        color: Colors.red[800],
    );
  }
}

