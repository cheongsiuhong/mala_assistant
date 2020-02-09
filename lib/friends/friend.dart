class Friend {
  String name;
  int spiceLevel;
  double budget;
  int appetite;

  static final List<Friend> defaultFriends = [
    new Friend(name: 'Eugene', spiceLevel: 3, appetite: 2, budget: 5.00),
    new Friend(name: 'Nicholas', spiceLevel: 2, appetite: 2, budget: 5.50),
    new Friend(name: 'Sebastian', spiceLevel: 3, appetite: 3, budget: 6.00),
    new Friend(name: 'Vanessa', spiceLevel: 5, appetite: 1, budget: 4.50),
  ];

  static final List<String> spiceList = [
    "No Spice",
    "Less Spicy",
    "Normal Spicy",
    "Extra Spicy",
    "Super Spicy"
  ];

  static final List<String> appetiteList = ["Small", "Average", "Large"];

  Friend({this.name, this.spiceLevel, this.appetite, this.budget});
}
