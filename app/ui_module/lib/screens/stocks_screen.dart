import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/screens/stocks_details_screen.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/stocks_viewmodel.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StocksViewModel(),
      child: Consumer<StocksViewModel>(
        builder: (context, stocksViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Stocks', style: AppTextStyles.h3),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildSectionHeader(context, 'AI Recommendations'),
                ...stocksViewModel.recommendedStocks.map((stock) => _buildStockItem(
                  context,
                  stock['name'],
                  stock['change'],
                  stock['change'].startsWith('+') ? AppColors.positive : Colors.red,
                )).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: AppTextStyles.h2),
    );
  }

  Widget _buildStockItem(BuildContext context, String name, String change, Color color) {
    return Card(
      child: ListTile(
        title: Text(name, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
        trailing: Text(change, style: AppTextStyles.bodyL.copyWith(color: color)),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StocksDetailsScreen()));
        },
      ),
    );
  }
}