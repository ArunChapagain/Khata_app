import 'package:flutter/material.dart';
import 'package:khata_app/Screen/add_expense_screen.dart';
import 'package:khata_app/Screen/load_fund_screen.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/bar_graph.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});
  // final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const BalanceViewer(),
            SizedBox(
              height: 545,
              child: ListView(
                children: [
                  Card(
                    margin: const EdgeInsets.all(7),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 7),
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
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            LoadFundScreen.routeName);
                                      },
                                      icon: Icon(
                                        Icons.archive,
                                        size: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(.9),
                                      ),
                                    ),
                                    const Text('Load Fund')
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            AddExpenseScreen.routeName);
                                      },
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
