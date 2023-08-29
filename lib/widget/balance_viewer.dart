import 'package:flutter/material.dart';
import 'package:khata_app/Provider/expenceprovider.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/widget/reload.dart';

class BalanceViewer extends StatelessWidget {
  const BalanceViewer({super.key});

  @override
  Widget build(BuildContext context) {
    double expense = 1;

    // double loaded =
    //     Provider.of<LoadedFundProvider>(context, listen: false).totalLoaded;
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
          leading: const Icon(
            Icons.account_balance_wallet,
            size: 30,
          ),
          title: Text(
            'NPR ${expense}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: const Text('Balance'),
          trailing: ReloadListTile(
            onPressed: () => false,
          )),
    );
  }
}
