import 'package:flutter/material.dart';

enum Categories{vegetable,fruit,spices,other,meat,dairy,carbs,sweets,convenience,hygiene}

class Category{
  const Category({required this.title,required this.color});

  final String title;
  final Color color;
}