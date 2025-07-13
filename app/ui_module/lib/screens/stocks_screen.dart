import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/screens/stocks_details_screen.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/stocks_viewmodel.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StocksViewModel>(context, listen: false).fetchRecommendedStocks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StocksViewModel>(
      builder: (context, stocksViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Stocks', style: AppTextStyles.h3),
            centerTitle: true,
          ),
          body: stocksViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : stocksViewModel.errorMessage != null
                  ? Center(child: Text('Error: ${stocksViewModel.errorMessage}'))
                  : ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _buildSectionHeader(context, 'AI Recommendations'),
                        ...stocksViewModel.recommendedStocks.map((stock) => _buildStockItem(
                              context,
                              stock,
                            )).toList(),
                      ],
                    ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: AppTextStyles.h2),
    );
  }

  Widget _buildStockItem(BuildContext context, StockInfo stock) {
    return Card(
      child: ListTile(
        title: Text(stock.name, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
        trailing: Text(
          '${stock.changeRate >= 0 ? '+' : ''}${stock.changeRate.toStringAsFixed(2)}%',
          style: AppTextStyles.bodyL.copyWith(color: stock.changeRate >= 0 ? AppColors.positive : Colors.red),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => StocksDetailsScreen(stock: stock)));
        },
      ),
    );
  }
}