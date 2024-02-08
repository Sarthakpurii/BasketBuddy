import 'package:flutter/material.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListTile(
        leading: Image.asset('assets/icons/list.png',scale: 16,color: Colors.white,),
      ),
      
    );
  }
}