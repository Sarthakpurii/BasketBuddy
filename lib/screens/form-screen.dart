import 'package:basketbuddy/data/categories.dart';
import 'package:basketbuddy/models/category.dart';
import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => NewItemScreenState();
}

class NewItemScreenState extends State<NewItemScreen> {

  Map<String,dynamic> itemDetails={
    'Category':categories.entries.last.value,
    'Title':'',
    'Quantity':1};

  Category selectedCategory=categories.entries.last.value;
  final _formKey=GlobalKey<FormState>();

  _submitItem(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
    print(itemDetails['Category'].title);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

 //TITLE
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                  label: Text('Title'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5)),
              validator: (value) {
                if(value==null ||value.trim().isEmpty){
                  return "Please Enter a valid title";
                }
                return null;
              },
              onSaved: (newValue) => itemDetails['Title']=newValue,
            ),
            const SizedBox(height: 5,),

//Quantity
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: '1',
                    validator: (value) {
                if(value==null ||value.trim().isEmpty || int.tryParse(value.trim())==null|| int.tryParse(value.trim())!<0){
                  return "Please Enter a valid Quantity";
                }
                return null;
              },
              onSaved: (newValue) => itemDetails['Quantity']=newValue,
                    decoration: const InputDecoration(
                      hintText: '1',
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        label: Text('Quantity')),
                  ),
                ),


//Category DropDown
                const SizedBox(width: 10,),
                Expanded(
                  child: DropdownButtonFormField(
                    
                    value: itemDetails['Category'],
                    elevation: 0,
                    items: [for (final category in categories.entries) 
                      DropdownMenuItem(
                        value: category.value,
                        child: Row(children: [
                          Container(width: 16,height: 16,color: category.value.color,),
                          const SizedBox(width: 20,),
                          Text(category.value.title)
                      ],))],
                      onChanged: (value) {itemDetails['Category']=value;}),
                )
              ],
            ),
            const SizedBox(height: 15,),

//Save Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(
                onPressed: (){Navigator.of(context).pop();}, 
                child: const Text('Cancel')),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: _submitItem, 
                child: const Text('Submit'))
            ],)
          ],
        ),
      )),
    );
  }
}
