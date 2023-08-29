import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/Provider/expenceprovider.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/render_expense_statement%20.dart';

class ExpenseStatementScreen extends ConsumerStatefulWidget {
  const ExpenseStatementScreen({super.key});

  @override
  ConsumerState<ExpenseStatementScreen> createState() =>
      _ExpenseStatementScreenState();
}

class _ExpenseStatementScreenState
    extends ConsumerState<ExpenseStatementScreen> {
  late var expenseFuture;

  @override
  void initState() {
    expenseFuture = ref.read(expenseProvider.notifier).loadExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.read(expenseProvider);
    print(data.length);

    return Scaffold(
      body: Column(
        children: [
          const BalanceViewer(),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 540,
            child: FutureBuilder(
              future: expenseFuture,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemBuilder: (ctx, index) {
                            return RenderExpenseStatement(
                              expense: data[index],
                            );
                          },
                          itemCount: data.length,
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
