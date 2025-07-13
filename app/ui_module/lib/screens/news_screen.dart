import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/screens/news_details_screen.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/news_viewmodel.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel(),
      child: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('News', style: AppTextStyles.h3),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ...newsViewModel.newsList.map((newsItem) => _buildNewsItem(
                  context,
                  newsItem,
                )).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, Map<String, dynamic> newsItem) {
    return Card(
      child: ListTile(
        leading: Image.network(newsItem['imageUrl'], width: 100, height: 56, fit: BoxFit.cover),
        title: Text(newsItem['title'], style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
        subtitle: Text(newsItem['subtitle'], style: AppTextStyles.bodyM),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDetailsScreen(newsItem: newsItem)));
        },
      ),
    );
  }
}