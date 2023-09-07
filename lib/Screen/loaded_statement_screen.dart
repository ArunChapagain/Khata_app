import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/render_loaded_statement.dart';

class LoadedStatementScreen extends ConsumerStatefulWidget {
  const LoadedStatementScreen({super.key});

  @override
  ConsumerState<LoadedStatementScreen> createState() =>
      _LoadedStatementScreenState();
}

class _LoadedStatementScreenState extends ConsumerState<LoadedStatementScreen> {
  late Future<void> _fundFuture;


  @override
  void initState() {
    _fundFuture = ref.read(loadedFundProvider.notifier).loadFunds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(loadedFundProvider);
    return Scaffold(
      body: Column(
        children: [
          const BalanceViewer(),
          const SizedBox(
            height: 5,
          ),
          FutureBuilder(
            future: _fundFuture,
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 543,
                        child: (data.isEmpty)
                            ? Center(
                                child: Card(
                                    margin: const EdgeInsets.all(7),
                                    elevation: 0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant
                                        .withOpacity(0.3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        'No Fund loaded yet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    )))
                            : Card(
                                margin: const EdgeInsets.all(7),
                                elevation: 0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant
                                    .withOpacity(0.3),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10),
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                    child: ListView.builder(
                                      itemBuilder: (ctx, index) {
                                        return RenderLoadedStatement(
                                          fund: data[index],
                                        );
                                      },
                                      itemCount: data.length,
                                    ),
                                  ),
                                ),
                              ),
                      ),
          )
        ],
      ),
    );
  }
}
