import 'package:mala_assistant/store/store.dart';
import 'package:mala_assistant/store/ingredient.dart';
import 'package:mala_assistant/store/foodtype.dart';

class DefaultStore extends Store {
  final String name = "Liang Ban Kung Fu";
  final List<Ingredient> ingredients = [
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
}