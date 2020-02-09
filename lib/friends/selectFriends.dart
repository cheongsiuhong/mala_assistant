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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            }));
  }
}
