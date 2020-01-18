import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final List<String> buttonNames = ["Friends", "Stores", "New Meal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Mala Assistant :)")
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
            child: nameToCard("Friends"),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/stores');
            },
            child: nameToCard("Stores"),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/meal');
            },
            child: nameToCard("New Meal"),
          ),
        ],
      )
    );
  }

  Card nameToCard(String name) {
    return new Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  )
              )
          ),
        ),
        color: Colors.red[800],
    );
  }
}

