import 'package:flutter/material.dart';

class OverviewViewModel extends ChangeNotifier {
  // Placeholder data for now
  String totalValue = '\$100,000';
  String todaysChange = '\$0.00';
  List<Map<String, dynamic>> topMovers = [
    {'name': 'Tech Innovators Inc.', 'change': '+10.00%', 'value': '\$10.00', 'color': Colors.green},
    {'name': 'Green Energy Solutions', 'change': '+8.00%', 'value': '\$8.00', 'color': Colors.green},
    {'name': 'Global Retail Group', 'change': '+5.00%', 'value': '\$5.00', 'color': Colors.green},
  ];
  List<Map<String, dynamic>> myStocks = [
    {'name': 'Tech Innovators Inc.', 'shares': '1000 shares'},
    {'name': 'Global Energy Solutions', 'shares': '500 shares'},
  ];
  Map<String, dynamic> marketNews = {
    'title': 'Tech Sector Shows Strong Growth',
    'subtitle': 'Analysts predict continued expansion in the tech industry, driven by innovation and consumer demand.',
    'imageUrl': 'https://via.placeholder.com/150',
    'source': 'Financial Times',
    'publishedDate': '2024-03-15 10:30 AM',
    'content': """In a bold move, Tech Giant Inc. has announced a significant shift in its investment strategy, focusing on renewable energy and sustainable technologies. This decision comes as part of the company's broader commitment to environmental responsibility and long-term growth. The company plans to allocate over \$5 billion over the next five years to fund research and development in these areas, as well as to acquire promising startups in the green tech sector. \n\nAnalysts predict that this strategy could not only enhance Tech Giant's brand image but also open up new revenue streams in the rapidly expanding market for sustainable solutions. However, some experts caution that the transition may present challenges, including navigating complex regulatory landscapes and managing the risks associated with emerging technologies. \n\nThe announcement has already sparked considerable interest among investors, with shares of Tech Giant Inc. experiencing a modest uptick in early trading. The company's CEO, Eleanor Vance, stated that this investment reflects a belief in the long-term viability of sustainable technologies and their potential to drive future economic growth. \n\nFurther details regarding specific investment projects and partnerships are expected to be released in the coming months. This strategic pivot by Tech Giant Inc. marks a significant development in the tech industry's approach to sustainability and could set a precedent for other major players in the sector.""",
  };
  String myProfileName = 'Ethan Carter';
  String myProfilePortfolioValue = '\$150,000';

  // You can add methods here to fetch data from services or update state
}
