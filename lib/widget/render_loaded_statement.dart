import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/models/loadfund.dart';

class RenderLoadedStatement extends StatelessWidget {
  const RenderLoadedStatement({required this.fund, super.key});
  final LoadedFund fund;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          elevation: 3,
          child: ListTile(
              leading: CircleAvatar(
                  maxRadius: 50,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
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
                            fund.amount.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )),
              title: Text(
                'Arun Chapagain',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat.MMMMEEEEd().format(fund.dateTime!),
                style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.6),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ))),
    );
  }
}
