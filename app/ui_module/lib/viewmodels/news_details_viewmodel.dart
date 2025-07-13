import 'package:flutter/material.dart';

class NewsDetailsViewModel extends ChangeNotifier {
  String newsTitle;
  String newsSource;
  String newsPublishedDate;
  String newsImageUrl;
  String newsContent;

  NewsDetailsViewModel({required Map<String, dynamic> newsItem}) 
      : newsTitle = newsItem['title'] ?? '',
        newsSource = newsItem['source'] ?? '',
        newsPublishedDate = newsItem['publishedDate'] ?? '',
        newsImageUrl = newsItem['imageUrl'] ?? '',
        newsContent = newsItem['content'] ?? '';

  // You can add methods here to fetch data from services or update state
}
