import 'package:flutter/material.dart';
import 'package:mala_assistant/pages/addFriend.dart';
import 'package:mala_assistant/pages/friend.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  List<Friend> malaFriends = [
    Friend(name: 'Eugene', spiceLevel: 1, appetite: 2, budget: 10)
  ];

  void addFriend(Friend friend) {
    setState(() => malaFriends.add(friend));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Mala Buddies'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: malaFriends.length,
          itemBuilder: (context, index) {
            return Card(
              child:
                  ListTile(onTap: () {}, title: Text(malaFriends[index].name)),
            );
          }),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new AddFriend(addFriend: addFriend)));
          },
          tooltip: 'Add Friend',
          child: new Icon(Icons.add)),
    );
  }
}
