import 'package:basketbuddy/screens/grocery-list-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const GroceryListScreen(groceryData: [],)));
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      leading: Image.asset('assets/icons/list.png',scale: 12,color: Colors.white.withOpacity(0.8),),
      title: Text(title,style: GoogleFonts.mulish(fontSize: 19),),
      trailing: Image.asset('assets/icons/next.png',scale: 12,color: Colors.white.withOpacity(0.8),),
    );
  }
}