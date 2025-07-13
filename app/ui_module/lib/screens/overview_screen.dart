import 'package:flutter/material.dart';
import 'package:ui_module/screens/my_page_screen.dart';
import 'package:ui_module/screens/news_screen.dart';
import 'package:ui_module/screens/stocks_screen.dart';
import 'package:ui_module/utils/theme.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stockking', style: AppTextStyles.h3),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context, 'My Portfolio'),
              _buildPortfolioSummary(),
              const SizedBox(height: 24.0),
              _buildSectionHeader(context, 'Top Movers'),
              _buildTopMovers(),
              const SizedBox(height: 24.0),
              _buildSectionHeader(context, 'My Stocks'),
              _buildMyStocks(),
              const SizedBox(height: 24.0),
               _buildSeeMoreButton(context, 'Stocks'),
              const SizedBox(height: 24.0),
              _buildSectionHeader(context, 'Market News'),
              _buildMarketNews(),
              const SizedBox(height: 24.0),
              _buildSeeMoreButton(context, 'News'),
              const SizedBox(height: 24.0),
              _buildSectionHeader(context, 'My Profile'),
              _buildMyProfile(),
              const SizedBox(height: 24.0),
              _buildSeeMoreButton(context, 'MyPage'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: AppTextStyles.h2),
    );
  }

  Widget _buildPortfolioSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Value', style: AppTextStyles.bodyL),
                Text('\$100,000', style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today\'s Change', style: AppTextStyles.bodyL),
                Text('\$0.00', style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopMovers() {
    return Card(
      child: Column(
        children: [
          _buildMoverItem('Tech Innovators Inc.', '+10.00%', '\$10.00', AppColors.positive),
          _buildMoverItem('Green Energy Solutions', '+8.00%', '\$8.00', AppColors.positive),
          _buildMoverItem('Global Retail Group', '+5.00%', '\$5.00', AppColors.positive),
        ],
      ),
    );
  }

  Widget _buildMoverItem(String name, String change, String value, Color color) {
    return ListTile(
      title: Text(name, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(change, style: AppTextStyles.bodyL.copyWith(color: color)),
          Text(value, style: AppTextStyles.bodyM),
        ],
      ),
    );
  }

  Widget _buildMyStocks() {
    return Card(
      child: Column(
        children: [
          _buildStockItem('Tech Innovators Inc.', '1000 shares'),
          _buildStockItem('Global Energy Solutions', '500 shares'),
        ],
      ),
    );
  }

  Widget _buildStockItem(String name, String shares) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.business)),
      title: Text(name, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
      subtitle: Text(shares, style: AppTextStyles.bodyM),
    );
  }

  Widget _buildMarketNews() {
    return Card(
      child: ListTile(
        title: Text('Tech Sector Shows Strong Growth', style: AppTextStyles.h3.copyWith(fontSize: 16)),
        subtitle: const Text('Analysts predict continued expansion in the tech industry, driven by innovation and consumer demand.'),
        trailing: Image.network('https://via.placeholder.com/150', width: 100, height: 153, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildMyProfile() {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
        title: Text('Ethan Carter', style: AppTextStyles.h2.copyWith(fontSize: 22)),
        subtitle: Text('Portfolio Value: \$150,000', style: AppTextStyles.bodyL),
      ),
    );
  }

  Widget _buildSeeMoreButton(BuildContext context, String tab) {
    return Center(
      child: TextButton(
        onPressed: () {
          // Find the index of the tab and navigate
          // final homeScreenState = context.findAncestorStateOfType<_HomeScreenState>();
          // if (homeScreenState != null) {
          //   final tabIndex = homeScreenState._widgetOptions.indexWhere((widget) {
          //     if (tab == 'Stocks') return widget is StocksScreen;
          //     if (tab == 'News') return widget is NewsScreen;
          //     if (tab == 'MyPage') return widget is MyPageScreen;
          //     return false;
          //   });
          //   if (tabIndex != -1) {
          //     homeScreenState._onItemTapped(tabIndex);
          //   }
          // }
        },
        child: Text('See More', style: AppTextStyles.button.copyWith(color: AppColors.textPrimary)),
      ),
    );
  }
}