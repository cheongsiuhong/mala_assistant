import 'package:flutter/material.dart';
import 'package:mala_assistant/pages/friend.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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
        title: Text('Mala buddies :D'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: malaFriends.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {},
                  title: Text(malaFriends[index].name)
              ),
            );
          }
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: addFriendScreen,
          tooltip: 'Add Friend',
          child: new Icon(Icons.add)
      ),
    );
  }

  void addFriendScreen() {
    Friend newFriend = new Friend();
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(
                      title: new Text('Add a new friend')
                  ),
                  body: new Form(
                      key: _formKey,
                      autovalidate: true,
                      child: new ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          children: <Widget>[
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              onSaved: (val) => newFriend.name = val,
                            ),
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Spice Level',
                              ),
                              onSaved: (val) =>
                              newFriend.spiceLevel = int.parse(val),
                            ),
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Budget',
                              ),
                              onSaved: (val) =>
                              newFriend.budget = double.parse(val),
                            ),
                            new TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Appetite',
                              ),
                              onSaved: (val) =>
                              newFriend.appetite = int.parse(val),
                            ),
                            new Container(
                                padding: const EdgeInsets.only(
                                    left: 40.0, top: 20.0),
                                child: new RaisedButton(
                                  child: const Text('Submit'),
                                  onPressed: () {
                                    final FormState form = _formKey.currentState;
                                    form.save();
                                    addFriend(newFriend);
                                    Navigator.pop(context);
                                  },
                                )
                            )
                          ])
                  ));
            }));
  }
}