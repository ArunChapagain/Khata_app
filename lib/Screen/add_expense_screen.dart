import 'package:flutter/material.dart';
import 'package:khata_app/Provider/expenceprovider.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatelessWidget {
  static const routeName = 'add-expense';
  AddExpenseScreen({super.key});



  final _formKey = GlobalKey<FormState>();




  var expense = Expense(
      id: null.toString(),
      uid: null.toString(),
      amount: 0,
      dateTime: DateTime.now(),
      description: '');

  void _saveForm(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<ExpenseProvider>(ctx, listen: false).addExpence(expense);
      _formKey.currentState!.reset();
      final snackBar = SnackBar(
        content: Center(
          child: Text(
            'Expense has been Added',
            style: Theme.of(ctx)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(ctx).colorScheme.primaryContainer),
          ),
        ),
      );
      FocusScope.of(ctx).unfocus();
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Expense',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    // margin: const EdgeInsets.symmetric(horizontal: )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(.35),
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().length <= 1) {
                                  return 'Description can\'t be null.';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.7),
                                  decorationThickness: 30,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  // overflow: TextOverflow.visible,
                                  height: 1),
                              onSaved: (value) {
                                expense = Expense(
                                    id: null.toString(),
                                    uid: null.toString(),
                                    amount: expense.amount,
                                    dateTime: expense.dateTime,
                                    description: value!);
                              },
                              decoration: InputDecoration(
                                  // fillColor: Colors.white,
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.85)),
                                  labelText: 'Add Description',
                                  suffixIcon: Icon(
                                    Icons.description_outlined,
                                    size: 30,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    int.tryParse(value) == null ||
                                    int.tryParse(value)! <= 0) {
                                  return 'Enter the valid Number';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                expense = Expense(
                                    id: null.toString(),
                                    uid: null.toString(),
                                    amount: double.parse(value!),
                                    dateTime: DateTime.now(),
                                    description: expense.description);
                              },
                              magnifierConfiguration:
                                  const TextMagnifierConfiguration(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.7),
                                  decorationThickness: 30,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  height: 1),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.85)),
                                  prefix: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Text(
                                      'रु',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(.6),
                                          height: .5,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  labelText: 'Amount',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        // elevation: 10,
                        shadowColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        elevation: 8),
                    onPressed: () {
                      _saveForm(context);
                    },
                    child: Text(
                      'Save Expense',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
