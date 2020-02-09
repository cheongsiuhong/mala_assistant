class Friend {
  String name;
  int spiceLevel;
  double budget;
  int appetite;

  static final Friend defaultFriend = new Friend(name: 'Eugene', spiceLevel: 1, appetite: 2, budget: 10);

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
