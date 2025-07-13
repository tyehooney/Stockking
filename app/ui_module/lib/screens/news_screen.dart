import 'package:flutter/material.dart';
import 'package:ui_module/screens/news_details_screen.dart';
import 'package:ui_module/utils/theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News', style: AppTextStyles.h3),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNewsItem(
            context,
            'Tech Giant\'s New Product Launch Boosts Market Confidence',
            '2024-01-20',
            'https://via.placeholder.com/100x56',
          ),
          _buildNewsItem(
            context,
            'Global Economic Outlook Revised Upwards by IMF',
            '2024-01-19',
            'https://via.placeholder.com/100x56',
          ),
          _buildNewsItem(
            context,
            'Interest Rate Hike Expected to Cool Down Inflation',
            '2024-01-18',
            'https://via.placeholder.com/100x56',
          ),
          _buildNewsItem(
            context,
            'Renewable Energy Sector Sees Record Investment',
            '2024-01-17',
            'https://via.placeholder.com/100x56',
          ),
          _buildNewsItem(
            context,
            'Automotive Industry Adapts to Electric Vehicle Demand',
            '2024-01-16',
            'https://via.placeholder.com/100x56',
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, String title, String date, String imageUrl) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl, width: 100, height: 56, fit: BoxFit.cover),
        title: Text(title, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
        subtitle: Text(date, style: AppTextStyles.bodyM),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewsDetailsScreen()));
        },
      ),
    );
  }
}