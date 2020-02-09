import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/addFriend.dart';
import 'package:mala_assistant/friends/friend.dart';
import 'package:mala_assistant/friends/friendPage.dart';

class FriendsView extends StatefulWidget {
  final List<Friend> friends;

  FriendsView({this.friends});

  @override
  _FriendsViewState createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  List<Friend> malaFriends;

  @override
  void initState() {
    this.malaFriends = widget.friends;
    super.initState();
  }

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
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FriendPage(friend: malaFriends[index])));
                  },
                  title: Text(malaFriends[index].name)),
            );
          }),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new AddFriend(addFriend: addFriend)));
          },
          backgroundColor: Colors.red[900],
          tooltip: 'Add Friend',
          child: new Icon(Icons.add)),
    );
  }
}
