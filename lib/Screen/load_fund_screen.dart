import 'package:flutter/material.dart';

class LoadFundScreen extends StatelessWidget {
  static const routeName = 'load-fund';
  const LoadFundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Load Amount',
          style: TextStyle(color: Theme.of(context).colorScheme.primary,
          ),

        ),
      ),
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
                  child: TextFormField(
                    magnifierConfiguration: const TextMagnifierConfiguration(),
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.7),
                        decorationThickness: 30,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
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
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        labelText: 'Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
                'Load Fund',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 20),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
