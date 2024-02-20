import 'package:basketbuddy/models/shopping-item.dart';
import 'package:basketbuddy/screens/grocery-list-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({super.key,required this.item});
  final ShoppingItem item;
  // final TextEditingController _titleInputController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (item.newItemStatus){
      return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      leading: Image.asset('assets/icons/list.png',scale: 12,color: Colors.white.withOpacity(0.8),),
      title: Container(
        // width: 150,
        child: const TextField(
          controller: ,
          decoration: InputDecoration(hintText: 'Enter Title'),
        )),
      trailing: Image.asset('assets/icons/next.png',scale: 12,color: Colors.white.withOpacity(0.8),),
      );
    }
    else
    {return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>GroceryListScreen(item:item)));
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      leading: Image.asset('assets/icons/list.png',scale: 12,color: Colors.white.withOpacity(0.8),),
      title: Text(item.title,style: GoogleFonts.mulish(fontSize: 19),),
      trailing: Image.asset('assets/icons/next.png',scale: 12,color: Colors.white.withOpacity(0.8),),
    );}
  }
}