import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/models/expense.dart';

class RenderExpenseStatement extends StatefulWidget {
  Expense expense;
   RenderExpenseStatement({super.key,required this.expense});

  @override
  State<RenderExpenseStatement> createState() => _RenderExpenseStatementState();
}

class _RenderExpenseStatementState extends State<RenderExpenseStatement> {
  bool _expanded = false;
  _RenderExpenseStatementState();

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
                          Text(
                            ' ${widget.expense.amount}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              title: Text(
                widget.expense.description,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(.7)),
                maxLines: 1,
              ),
              subtitle: Text(
                DateFormat.yMEd().format(widget.expense.dateTime!),
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
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: 45,
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
                      widget.expense.description,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.surfaceTint),
                      overflow: TextOverflow.fade,
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
