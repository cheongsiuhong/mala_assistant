import 'package:flutter/material.dart';
import 'package:mala_assistant/pages/friend.dart';

class FriendPage extends StatelessWidget {
  final Friend friend;

  FriendPage({this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Name: ',
                  style: TextStyle(
                    fontSize: 20.0
                  )
                ),
                Text(
                  friend.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.05
                  )
                )
              ]
            ),
            SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                      'Budget: ',
                      style: TextStyle(
                          fontSize: 20.0
                      )
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      "\$" + friend.budget.toStringAsFixed(2).toString(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.05
                      )
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                      'Appetite: ',
                      style: TextStyle(
                          fontSize: 20.0
                      )
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      Friend.appetiteList[friend.appetite - 1],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.05
                      )
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                      'Spice Level: ',
                      style: TextStyle(
                          fontSize: 20.0
                      )
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      Friend.spiceList[friend.spiceLevel - 1],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.05
                      )
                  ),
                )
              ],
            ),
          ]
        )
      )
    );
  }
}

