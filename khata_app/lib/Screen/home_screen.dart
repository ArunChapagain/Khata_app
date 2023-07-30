import 'package:flutter/material.dart';
import 'package:khata_app/widget/bar_graph.dart';
import 'package:khata_app/widget/reload.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: ListTile(
                  leading: const Icon(
                    Icons.account_balance_wallet,
                    size: 30,
                  ),
                  title: Text(
                    'NPR ${100}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: const Text('Balance'),
                  trailing: ReloadListTile(
                    onPressed: () => false,
                  )),
            ),
            Container(
              height: 545,
              child: ListView(
                children: [
                  Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.archive,
                                        size: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(.9),
                                      ),
                                    ),
                                    const Text('Add Money')
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(.9),
                                      ),
                                    ),
                                    const Text('Add Expense')
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.3),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Center(child: BarChartSample2()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
