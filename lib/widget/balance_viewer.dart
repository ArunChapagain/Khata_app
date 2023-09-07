import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/models/current_balance.dart';
import 'package:khata_app/widget/reload.dart';

class BalanceViewer extends ConsumerStatefulWidget {
  const BalanceViewer({super.key});

  @override
  ConsumerState<BalanceViewer> createState() => _BalanceViewerState();
}

class _BalanceViewerState extends ConsumerState<BalanceViewer> {
  final balance = CurrentBalance.balanceAmount;

  @override
  Widget build(BuildContext context) {
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
            'NPR $balance',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: const Text('Balance'),
          trailing: ReloadListTile(
            onPressed: () => false,
          )),
    );
  }
}
