import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/screens/news_details_screen.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/home_viewmodel.dart';
import 'package:ui_module/viewmodels/overview_viewmodel.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OverviewViewModel(),
      child: Consumer<OverviewViewModel>(
        builder: (context, overviewViewModel, child) {
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
                    _buildPortfolioSummary(overviewViewModel),
                    const SizedBox(height: 24.0),
                    _buildSectionHeader(context, 'Top Movers'),
                    _buildTopMovers(overviewViewModel),
                    const SizedBox(height: 24.0),
                    _buildSectionHeader(context, 'My Stocks'),
                    _buildMyStocks(overviewViewModel),
                    const SizedBox(height: 24.0),
                    _buildSeeMoreButton(context, 'Stocks'),
                    const SizedBox(height: 24.0),
                    _buildSectionHeader(context, 'Market News'),
                    _buildMarketNews(context, overviewViewModel),
                    const SizedBox(height: 24.0),
                    _buildSeeMoreButton(context, 'News'),
                    const SizedBox(height: 24.0),
                    _buildSectionHeader(context, 'My Profile'),
                    _buildMyProfile(overviewViewModel),
                    const SizedBox(height: 24.0),
                    _buildSeeMoreButton(context, 'MyPage'),
                  ],
                ),
              ),
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

  Widget _buildPortfolioSummary(OverviewViewModel viewModel) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Value', style: AppTextStyles.bodyL),
                Text(viewModel.totalValue, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today\'s Change', style: AppTextStyles.bodyL),
                Text(viewModel.todaysChange, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopMovers(OverviewViewModel viewModel) {
    return Card(
      child: Column(
        children: viewModel.topMovers.map((mover) => _buildMoverItem(
          mover['name'],
          mover['change'],
          mover['value'],
          mover['color'],
        )).toList(),
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

  Widget _buildMyStocks(OverviewViewModel viewModel) {
    return Card(
      child: Column(
        children: viewModel.myStocks.map((stock) => _buildStockItem(
          stock['name'],
          stock['shares'],
        )).toList(),
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

  Widget _buildMarketNews(BuildContext context, OverviewViewModel viewModel) {
    return Card(
      child: ListTile(
        title: Text(viewModel.marketNews['title'], style: AppTextStyles.h3.copyWith(fontSize: 16)),
        subtitle: Text(viewModel.marketNews['subtitle']),
        trailing: Image.network(viewModel.marketNews['imageUrl'], width: 100, height: 153, fit: BoxFit.cover),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDetailsScreen(newsItem: viewModel.marketNews)));
        },
      ),
    );
  }

  Widget _buildMyProfile(OverviewViewModel viewModel) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
        title: Text(viewModel.myProfileName, style: AppTextStyles.h2.copyWith(fontSize: 22)),
        subtitle: Text('Portfolio Value: \${viewModel.myProfilePortfolioValue}', style: AppTextStyles.bodyL),
      ),
    );
  }

  static Widget _buildSeeMoreButton(BuildContext context, String tab) {
    return Center(
      child: TextButton(
        onPressed: () {
          final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
          int tabIndex = 0; // Default to Overview
          if (tab == 'Stocks') {
            tabIndex = 1;
          }
          else if (tab == 'News') {
            tabIndex = 2;
          }
          else if (tab == 'MyPage') {
            tabIndex = 3;
          }
          homeViewModel.onItemTapped(tabIndex);
        },
        child: Text('See More', style: AppTextStyles.button.copyWith(color: AppColors.textPrimary)),
      ),
    );
  }
}