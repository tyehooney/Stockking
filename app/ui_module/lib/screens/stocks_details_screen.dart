import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/stocks_details_viewmodel.dart';

class StocksDetailsScreen extends StatelessWidget {
  const StocksDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StocksDetailsViewModel(),
      child: Consumer<StocksDetailsViewModel>(
        builder: (context, stocksDetailsViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Stock Details', style: AppTextStyles.h3),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stocksDetailsViewModel.stockName, style: AppTextStyles.h2),
                  const SizedBox(height: 8.0),
                  Text('Current Price: \${stocksDetailsViewModel.stockPrice}', style: AppTextStyles.bodyL),
                  const SizedBox(height: 24.0),
                  _buildPriceTrendChart(stocksDetailsViewModel),
                  const SizedBox(height: 24.0),
                  _buildActionButtons(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPriceTrendChart(StocksDetailsViewModel viewModel) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Price Trend', style: AppTextStyles.h3),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(viewModel.stockPrice, style: AppTextStyles.h1.copyWith(fontSize: 32)),
                Text(viewModel.stockChange, style: AppTextStyles.h3.copyWith(color: viewModel.stockChangeColor)),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text('Last 6 Months', style: AppTextStyles.bodyM),
            const SizedBox(height: 16.0),
            // Placeholder for the chart
            Container(
              height: 148,
              color: AppColors.inputBackground,
              child: const Center(child: Text('Chart Placeholder')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            child: const Text('Buy', style: AppTextStyles.button),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.inputBackground,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            child: Text('Sell', style: AppTextStyles.button.copyWith(color: AppColors.textPrimary)),
          ),
        ),
      ],
    );
  }
}
