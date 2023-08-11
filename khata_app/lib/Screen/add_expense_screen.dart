import 'package:flutter/material.dart';
import 'package:khata_app/widget/on_hover_button.dart';

class AddExpenseScreen extends StatelessWidget {
  static const routeName = 'add-expense';
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            Card(
              // margin: const EdgeInsets.symmetric(horizontal: )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              color:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(.35),
              child: Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        magnifierConfiguration:
                            const TextMagnifierConfiguration(),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.7),
                            decorationThickness: 30,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 1),
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.85)),
                            labelText: 'Add Description',
                            suffixIcon: const Icon(
                              Icons.description_outlined,
                              size: 30,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
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
                                    height: 1,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w600),
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
            OnHoverButton(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Theme.of(context).colorScheme.primary,
            
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
                  elevation: 5,
                ),
                onHover: (value) {},
                onPressed: () {},
                child: Text(
                  'Save Expense',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
