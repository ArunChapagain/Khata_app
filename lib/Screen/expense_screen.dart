import 'package:flutter/material.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/render_expense_statement%20.dart';
import 'package:khata_app/widget/render_loaded_statement.dart';
import 'package:provider/provider.dart';

class ExpenseStatementScreen extends StatefulWidget {
  const ExpenseStatementScreen({super.key});

  @override
  State<ExpenseStatementScreen> createState() => _ExpenseStatementScreenState();
}

class _ExpenseStatementScreenState extends State<ExpenseStatementScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LoadedFundProvider>(context, listen: false)
        .getloadedStatement;
    return Scaffold(
      body: Column(
        children: [
          const BalanceViewer(),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 540,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return const RenderExpenseStatement();
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
