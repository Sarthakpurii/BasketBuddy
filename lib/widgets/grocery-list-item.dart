import 'package:basketbuddy/models/grocery-item.dart';
import 'package:flutter/material.dart';

class GroceryListItem extends StatelessWidget{
  const GroceryListItem({super.key,required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(context){
    return Container(
      height: 50,
      child: Row(children: [
        const SizedBox(width: 12.5,),
        Container(width: 25,height: 25,color: grocery.category.color,),
        const SizedBox(width: 12.5,),
        Text(grocery.name),
        const Spacer(),
        Text(grocery.quantity.toString()),
        const SizedBox(width: 12.5,)
      ],),
    );
  }
}