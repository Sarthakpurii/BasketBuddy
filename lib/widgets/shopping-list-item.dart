import 'package:basketbuddy/models/shopping-item.dart';
import 'package:basketbuddy/providers/shopping-list-provider.dart';
import 'package:basketbuddy/screens/grocery-list-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListItem extends ConsumerWidget {
  const ShoppingListItem({super.key,required this.item,this.titleController,this.fnode});
  final ShoppingItem item;
  final TextEditingController? titleController;
  final FocusNode? fnode;
  // final TextEditingController _titleInputController=TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    if (titleController!=null) titleController!.clear();
    if (item.newItemStatus){
      return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      leading: Image.asset('assets/icons/list.png',scale: 12,color: Colors.white.withOpacity(0.8),),
      title: TextField(
        focusNode: fnode,
        controller: titleController,
        decoration: const InputDecoration(hintText: 'Enter Title'),
        onSubmitted: (value){
          if(value.trim().isEmpty){
            ref.read(shoppingListProvider.notifier).removeItem(null);
          }
          else{
            ref.read(shoppingListProvider.notifier).removeItem(titleController!.text);
          }
        },
      ),
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