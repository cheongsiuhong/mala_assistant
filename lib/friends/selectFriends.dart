import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';

class SelectFriends extends StatefulWidget {
  final List<Friend> friends;
  final Function(List<Friend>) setSelectedFriends;

  SelectFriends({@required this.friends, @required this.setSelectedFriends});

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
          }),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            if (isSelected.any((val) => val)) {
              widget.setSelectedFriends(selectedFriends());
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text("Lonely?"),
                        content: Text("Select at least yourself!"),
                        actions: <Widget>[
                          new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      ),
                  barrierDismissible: true);
            }
          },
          backgroundColor: Colors.red[900],
          tooltip: 'Done selecting',
          child: new Icon(Icons.check)),
    );
  }
}
