
import 'package:basketbuddy/models/category.dart';
import 'package:uuid/uuid.dart';

class GroceryItem{
  GroceryItem({required this.name, required this.quantity, required this.category}): id=const Uuid().v4();

  final String id;
  final String name;
  final int quantity;
  final Category category;

}