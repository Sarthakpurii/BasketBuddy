import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => NewItemScreenState();
}

class NewItemScreenState extends State<NewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Form(child: 
      Container(padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
                contentPadding: EdgeInsets.symmetric(horizontal: 5)
              ),
            ),
          ),
          Row(children: [
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: '1',
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                label: Text('Quantity')),
            ),
            
          ],)
        ],
      ),)),
    );
  }
}