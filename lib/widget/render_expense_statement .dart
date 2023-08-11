import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/Provider/color_palete.dart';
import 'package:khata_app/Provider/expenceprovider.dart' as expense;

class RenderExpenseStatement extends StatefulWidget {
  final expense.Expense stm;

  const RenderExpenseStatement({required this.stm, super.key});

  @override
  State<RenderExpenseStatement> createState() => _RenderExpenseStatementState();
}

class _RenderExpenseStatementState extends State<RenderExpenseStatement> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        elevation: 3,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  maxRadius: 50,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'रु',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.6),
                                height: 1,
                                fontSize: 35,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '200',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )),
              title: Text(
                '1 Kg Apple',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                '2074/3/4',
                style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.6),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),

                // DateFormat.yMMMd().format('2074-23-2'),
              ),
              trailing: IconButton(
                icon: Icon(
                  _expanded
                      ? Icons.keyboard_double_arrow_down_rounded
                      : Icons.keyboard_double_arrow_right_rounded,
                  size: 35,
                ),
                onPressed: () => setState(
                  () {
                    _expanded = !_expanded;
                  },
                ),
              ),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Transaction By:',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceTint),
                        ),
                        Text(
                          'Arun',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceTint
                                      .withOpacity(.9)),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1.5),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Purchased items:  ! kg tarkali , 2 kg onion , 1 pow mushroom',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.surfaceTint),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
