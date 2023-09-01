import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/widget/reload.dart';

class BalanceViewer extends ConsumerStatefulWidget {
  const BalanceViewer({super.key});

  @override
  ConsumerState<BalanceViewer> createState() => _BalanceViewerState();
}

class _BalanceViewerState extends ConsumerState<BalanceViewer> {
  double expense = 1;
  @override
  void initState() {
    ref.read(loadedFundProvider.notifier).totalLoadedFund();
    super.initState();
  }

  Widget build(BuildContext context) {
    final loaded = ref.read(loadedFundProvider.notifier).getLoadedamount;

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
            'NPR ${loaded}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: const Text('Balance'),
          trailing: ReloadListTile(
            onPressed: () => false,
          )),
    );
  }
}
