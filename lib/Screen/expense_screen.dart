import 'package:flutter/material.dart';
import 'package:khata_app/Provider/expenceprovider.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/render_expense_statement%20.dart';
import 'package:provider/provider.dart';

class ExpenseStatementScreen extends StatefulWidget {
  const ExpenseStatementScreen({super.key});

  @override
  State<ExpenseStatementScreen> createState() => _ExpenseStatementScreenState();
}

class _ExpenseStatementScreenState extends State<ExpenseStatementScreen> {
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ExpenseProvider>(context, listen: false).expenseStatement;
    return Scaffold(
      body: Column(
        children: [
          const BalanceViewer(),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 540,
            child: Consumer<ExpenseProvider>(
              builder: (context, value, child) => ListView.builder(
                itemBuilder: (ctx, index) {
                  return RenderExpenseStatement(
                    stm: value.expenseStatement[index],
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
