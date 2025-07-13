import 'package:flutter/material.dart';
import 'package:ui_module/screens/stocks_details_screen.dart';
import 'package:ui_module/utils/theme.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks', style: AppTextStyles.h3),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, 'AI Recommendations'),
          _buildStockItem(context, 'Tech Innovators Inc.', '+2.3%', AppColors.positive),
          _buildStockItem(context, 'Global Energy Corp.', '-1.5%', Colors.red),
          _buildStockItem(context, 'Health Solutions Ltd.', '+0.8%', AppColors.positive),
          _buildStockItem(context, 'Financial Services Group', '-0.5%', Colors.red),
          _buildStockItem(context, 'Consumer Goods Co.', '+1.2%', AppColors.positive),
        ],
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