import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';

class SelectFriends extends StatefulWidget {
  final List<Friend> friends;

  SelectFriends({this.friends});

  @override
  _SelectFriendsState createState() => _SelectFriendsState();
}

class _SelectFriendsState extends State<SelectFriends> {
  List<Friend> friends;
  List<bool> isSelected;

  @override
  void initState() {
    this.friends = widget.friends;
    isSelected = new List<bool>.filled(friends.length, false, growable: false);
    super.initState();
  }

  CheckboxListTile createCheckBox(Friend friend, int index) {
    return CheckboxListTile(
      title: Text(friend.name),
      value: isSelected[index],
      onChanged: (bool value) {
        setState(() {
          isSelected[index] = value;
        });
      },
    );
  }

  List<Friend> selectedFriends() {
    List<Friend> res = [];
    for (var i = 0; i < friends.length; i++) {
      if (isSelected[i]) res.add(friends[i]);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, "/home");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: new AppBar(
          title: Text('Select Friends'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return createCheckBox(friends[index], index);
            }),
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, selectedFriends());
            },
            backgroundColor: Colors.red[900],
            tooltip: 'Done selecting',
            child: new Icon(Icons.check)),
      ),
    );
  }
}
