import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/news_details_viewmodel.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const NewsDetailsScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsDetailsViewModel(newsItem: newsItem),
      child: Consumer<NewsDetailsViewModel>(
        builder: (context, newsDetailsViewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.newsBackground,
            appBar: AppBar(
              backgroundColor: AppColors.newsBackground,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.newsText),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text('News', style: AppTextStyles.h3,)
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsDetailsViewModel.newsTitle,
                    style: AppTextStyles.h2,
                  ),
                  const SizedBox(height: 12.0),
                  Image.network(newsDetailsViewModel.newsImageUrl),
                  const SizedBox(height: 12.0),
                  Text(
                    'Source: \${newsDetailsViewModel.newsSource} | Published: \${newsDetailsViewModel.newsPublishedDate}',
                    style: AppTextStyles.bodyM,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    newsDetailsViewModel.newsContent,
                    style: AppTextStyles.bodyL,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
