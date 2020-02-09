import 'package:flutter/material.dart';
import 'package:mala_assistant/friends/friend.dart';

class AddFriend extends StatefulWidget {
  final Function(Friend) addFriend;

  AddFriend({@required this.addFriend});

  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _formNameValue;
  int _formSpiceValue = 2;
  double _formBudgetValue;
  int _formAppetiteValue = 1;

  final RegExp dollarExp = new RegExp(
    r'(([1-9]\d{0,2}(,\d{3})*)|(([1-9]\d*)?\d))(\.\d\d)?$');

  void setSpice(int val) {
    setState(() => _formSpiceValue = val);
  }

  void setAppetite(int val) {
    setState(() => _formAppetiteValue = val);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: Text('Add a new friend'),
          centerTitle: true,
          elevation: 0,
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name should not be empty';
                      }
                      return null;
                    },
                    onSaved: (val) => _formNameValue = val,
                  ),
                  new DropdownButtonFormField(
                    value: Friend.spiceList[_formSpiceValue],
                    decoration: const InputDecoration(labelText: 'Spice Level'),
                    items:
                        Friend.spiceList.map<DropdownMenuItem<String>>((String val) {
                      return new DropdownMenuItem(child: Text(val), value: val);
                    }).toList(),
                    onChanged: (String val) => setSpice(Friend.spiceList.indexOf(val)),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Budget',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Budget should not be empty';
                      }
                      if (!dollarExp.hasMatch(value)) {
                        return 'Budget should be a decimal number';
                      }
                      return null;
                    },
                    onSaved: (val) => _formBudgetValue = double.parse(val),
                  ),
                  new DropdownButtonFormField(
                    value: Friend.appetiteList[_formAppetiteValue],
                    decoration: const InputDecoration(labelText: 'Appetite'),
                    items: Friend.appetiteList
                        .map<DropdownMenuItem<String>>((String val) {
                      return new DropdownMenuItem(child: Text(val), value: val);
                    }).toList(),
                    onChanged: (String val) =>
                        setAppetite(Friend.appetiteList.indexOf(val)),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          final FormState form = _formKey.currentState;
                          form.save();
                          widget.addFriend(new Friend(
                              name: _formNameValue,
                              spiceLevel: _formSpiceValue + 1,
                              appetite: _formAppetiteValue + 1,
                              budget: _formBudgetValue));
                          Navigator.pop(context);
                        },
                      ))
                ])));
  }
}
