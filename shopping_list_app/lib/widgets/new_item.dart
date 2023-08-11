import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatelessWidget {
  NewItem({super.key});

  var _enteredName = '';
  var _enteredNumber = 0.0;
  final _formKey =
      GlobalKey<FormState>(); //only need globle key to work with the form

  void _saveItem() {
    if (_formKey.currentState!.validate()) //returns the boolen value
    {
      _formKey.currentState!.save(); //this method is cricual to save the form
      print(_enteredName);
      print(_enteredNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add item')),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Title')),
                  validator: (value) {
                    //you will able to tell flutter when to validate the form
////to run the validation logic in the form field
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 1 and 50 characters.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: '1',
                        decoration:
                            const InputDecoration(label: Text('Quantity')),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Enter the valid Number';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _enteredNumber = double.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(items: [
                        for (final category in categories.entries)
                          // entries convert the map to the list
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(category.value.title)
                              ],
                            ),
                          )
                      ], onChanged: (value) {}),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text('Reset')),
                    ElevatedButton(
                      onPressed: _saveItem,
                      child: const Text('Add item'),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
