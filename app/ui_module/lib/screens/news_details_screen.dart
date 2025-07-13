import 'package:flutter/material.dart';
import 'package:ui_module/utils/theme.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Tech Giant\'s New Investment Strategy',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 12.0),
            Image.network('https://via.placeholder.com/358x260'),
            const SizedBox(height: 12.0),
            const Text(
              'Source: Financial Times | Published: 2024-03-15 10:30 AM',
              style: AppTextStyles.bodyM,
            ),
            const SizedBox(height: 12.0),
            const Text(
              'In a bold move, Tech Giant Inc. has announced a significant shift in its investment strategy, focusing on renewable energy and sustainable technologies. This decision comes as part of the company\'s broader commitment to environmental responsibility and long-term growth. The company plans to allocate over \$5 billion over the next five years to fund research and development in these areas, as well as to acquire promising startups in the green tech sector. 

Analysts predict that this strategy could not only enhance Tech Giant\'s brand image but also open up new revenue streams in the rapidly expanding market for sustainable solutions. However, some experts caution that the transition may present challenges, including navigating complex regulatory landscapes and managing the risks associated with emerging technologies. 

The announcement has already sparked considerable interest among investors, with shares of Tech Giant Inc. experiencing a modest uptick in early trading. The company\'s CEO, Eleanor Vance, stated that this investment reflects a belief in the long-term viability of sustainable technologies and their potential to drive future economic growth. 

Further details regarding specific investment projects and partnerships are expected to be released in the coming months. This strategic pivot by Tech Giant Inc. marks a significant development in the tech industry\'s approach to sustainability and could set a precedent for other major players in the sector.',
              style: AppTextStyles.bodyL,
            ),
          ],
        ),
      ),
    );
  }
}
