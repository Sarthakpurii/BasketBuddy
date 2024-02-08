import 'package:basketbuddy/data/categories.dart';
import 'package:basketbuddy/models/category.dart';
import 'package:basketbuddy/models/grocery-item.dart';

final groceryItems = [
  GroceryItem(
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
