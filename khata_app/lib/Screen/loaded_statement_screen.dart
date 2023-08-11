import 'package:flutter/material.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/widget/balance_viewer.dart';
import 'package:khata_app/widget/render_loaded_statement.dart';
import 'package:provider/provider.dart';

class LoadedStatementScreen extends StatefulWidget {
  const LoadedStatementScreen({super.key});

  @override
  State<LoadedStatementScreen> createState() => _LoadedStatementScreenState();
}

class _LoadedStatementScreenState extends State<LoadedStatementScreen> {
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
                return const RenderLoadedStatement();
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
