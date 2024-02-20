class ShoppingItem{
  const ShoppingItem({required this.title, required this.newItemStatus});

  final String title;
  final bool newItemStatus; //true while the item is created and is being set otherwise false
}