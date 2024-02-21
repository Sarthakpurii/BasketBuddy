import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/models/shopping-item.dart';
import 'package:basketbuddy/providers/shopping-list-provider.dart';
import 'package:basketbuddy/widgets/shopping-list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  void _addShoppingItemToList(){
    ref.read(shoppingListProvider.notifier).addShoppingItem('', true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
    fnode.requestFocus();
  });  }

  late final TextEditingController _titleController;
  late final FocusNode fnode;
  bool isFABvisible=true;

  @override
  void initState() {
    super.initState();
    _titleController=TextEditingController();
    fnode=FocusNode();

    fnode.addListener(() {
      if (fnode.hasFocus) {
        setState(()=>isFABvisible=false);
        }
      else {
        setState(()=>isFABvisible=true);
        if(_titleController.text.trim().isEmpty) {ref.read(shoppingListProvider.notifier).removeItem(null);}
        else {ref.read(shoppingListProvider.notifier).removeItem(_titleController.text.trim());
      }}
    });
  }


  @override
  Widget build(BuildContext context) {
    final Map<ShoppingItem,List<GroceryItem>> shoppingList=ref.watch(shoppingListProvider);

    final List<ShoppingItem> shoppingListTitle=shoppingList.keys.toList();    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
    ),
     body: ListView.builder(
      itemCount: shoppingList.length,
      itemBuilder: (ctx,index)=>ShoppingListItem(item: shoppingListTitle[index], titleController: shoppingListTitle[index].newItemStatus ? _titleController : null,
  fnode: shoppingListTitle[index].newItemStatus ? fnode : null,)),

    floatingActionButton: isFABvisible?FloatingActionButton(elevation: 0,
    onPressed: _addShoppingItemToList,
    shape: const CircleBorder(),
    child: const Icon(Icons.add),):null,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    fnode.removeListener((){});
    fnode.dispose();
    super.dispose();
  }
}