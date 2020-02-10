import 'package:mala_assistant/store/foodtype.dart';
import 'package:mala_assistant/store/ingredient.dart';

class Store {
  String name;
  List<Ingredient> ingredients;

  static final List<Store> defaultStores = [
    new Store(name: _store1, ingredients: _ingredients1),
    new Store(name: _store2, ingredients: _ingredients2),
    new Store(name: _store3, ingredients: _ingredients3),
    new Store(name: _store4, ingredients: _ingredients4),
    new Store(name: _store5, ingredients: _ingredients5),
  ];

  static final String _store1 = "Liang Ban Kung Fu";
  static final List<Ingredient> _ingredients1 = [
    new Ingredient(name: "Rice", price: 0.50, type: FoodType.carb),
    new Ingredient(name: "Maggi", price: 1.00, type: FoodType.carb),
    new Ingredient(name: "Chicken", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Beef", price: 2.00, type: FoodType.meat),
    new Ingredient(name: "Pork", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Cabbage", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Lettuce", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Kang Kong", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Broccoli", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Fish", price: 2.50, type: FoodType.seafood),
    new Ingredient(name: "Prawn", price: 2.00, type: FoodType.seafood),
    new Ingredient(name: "Enoki Mushroom", price: 1.00, type: FoodType.mushroom),
    new Ingredient(name: "Oyster Mushroom", price: 1.50, type: FoodType.mushroom),
  ];

  static final String _store2 = "Somerset FoodCourt Ma;a";
  static final List<Ingredient> _ingredients2 = [
    new Ingredient(name: "Rice", price: 1.00, type: FoodType.carb),
    new Ingredient(name: "Maggi", price: 2.00, type: FoodType.carb),
    new Ingredient(name: "Chicken", price: 2.00, type: FoodType.meat),
    new Ingredient(name: "Beef", price: 2.50, type: FoodType.meat),
    new Ingredient(name: "Pork", price: 2.00, type: FoodType.meat),
    new Ingredient(name: "Cabbage", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Lettuce", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Kang Kong", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Broccoli", price: 2.00, type: FoodType.vegetable),
    new Ingredient(name: "Fish", price: 3.00, type: FoodType.seafood),
    new Ingredient(name: "Prawn", price: 3.00, type: FoodType.seafood),
    new Ingredient(name: "Enoki Mushroom", price: 1.50, type: FoodType.mushroom),
    new Ingredient(name: "Oyster Mushroom", price: 1.50, type: FoodType.mushroom),
  ];

  static final String _store3 = "La Bu La";
  static final List<Ingredient> _ingredients3 = [
    new Ingredient(name: "Rice", price: 0.50, type: FoodType.carb),
    new Ingredient(name: "Maggi", price: 1.00, type: FoodType.carb),
    new Ingredient(name: "Chicken", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Beef", price: 2.00, type: FoodType.meat),
    new Ingredient(name: "Pork", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Cabbage", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Lettuce", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Kang Kong", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Broccoli", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Fish", price: 2.50, type: FoodType.seafood),
    new Ingredient(name: "Prawn", price: 2.00, type: FoodType.seafood),
    new Ingredient(name: "Enoki Mushroom", price: 1.00, type: FoodType.mushroom),
    new Ingredient(name: "Oyster Mushroom", price: 1.50, type: FoodType.mushroom),
  ];

  static final String _store4 = "Green On Earth";
  static final List<Ingredient> _ingredients4 = [
    new Ingredient(name: "Rice", price: 0.50, type: FoodType.carb),
    new Ingredient(name: "Maggi", price: 1.00, type: FoodType.carb),
    new Ingredient(name: "Cabbage", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Lettuce", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Kang Kong", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Broccoli", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Eggplant", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Pek Chye", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Enoki Mushroom", price: 1.00, type: FoodType.mushroom),
    new Ingredient(name: "Oyster Mushroom", price: 1.50, type: FoodType.mushroom),
    new Ingredient(name: "Button Mushroom", price: 1.50, type: FoodType.mushroom),
    new Ingredient(name: "Shitake Mushroom", price: 1.50, type: FoodType.mushroom),
  ];

  static final String _store5 = "NUS FineFood Mala";
  static final List<Ingredient> _ingredients5 = [
    new Ingredient(name: "Rice", price: 0.50, type: FoodType.carb),
    new Ingredient(name: "Maggi", price: 1.00, type: FoodType.carb),
    new Ingredient(name: "Chicken", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Beef", price: 2.00, type: FoodType.meat),
    new Ingredient(name: "Pork", price: 1.50, type: FoodType.meat),
    new Ingredient(name: "Cabbage", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Lettuce", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Kang Kong", price: 1.00, type: FoodType.vegetable),
    new Ingredient(name: "Broccoli", price: 1.50, type: FoodType.vegetable),
    new Ingredient(name: "Fish", price: 2.50, type: FoodType.seafood),
    new Ingredient(name: "Prawn", price: 2.00, type: FoodType.seafood),
    new Ingredient(name: "Enoki Mushroom", price: 1.00, type: FoodType.mushroom),
    new Ingredient(name: "Oyster Mushroom", price: 1.50, type: FoodType.mushroom),
  ];

  Store({this.name, this.ingredients});
}

