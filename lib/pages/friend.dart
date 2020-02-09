class Friend {
  String name;
  int spiceLevel;
  double budget;
  int appetite;

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
