import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> newsList = [
    {
      'title': 'Tech Sector Shows Strong Growth',
      'subtitle': 'Analysts predict continued expansion in the tech industry, driven by innovation and consumer demand.',
      'imageUrl': 'https://via.placeholder.com/150',
      'source': 'Financial Times',
      'publishedDate': '2024-03-15 10:30 AM',
      'content': """In a bold move, Tech Giant Inc. has announced a significant shift in its investment strategy, focusing on renewable energy and sustainable technologies. This decision comes as part of the company's broader commitment to environmental responsibility and long-term growth. The company plans to allocate over \$5 billion over the next five years to fund research and development in these areas, as well as to acquire promising startups in the green tech sector. \n\nAnalysts predict that this strategy could not only enhance Tech Giant's brand image but also open up new revenue streams in the rapidly expanding market for sustainable solutions. However, some experts caution that the transition may present challenges, including navigating complex regulatory landscapes and managing the risks associated with emerging technologies. \n\nThe announcement has already sparked considerable interest among investors, with shares of Tech Giant Inc. experiencing a modest uptick in early trading. The company's CEO, Eleanor Vance, stated that this investment reflects a belief in the long-term viability of sustainable technologies and their potential to drive future economic growth. \n\nFurther details regarding specific investment projects and partnerships are expected to be released in the coming months. This strategic pivot by Tech Giant Inc. marks a significant development in the tech industry's approach to sustainability and could set a precedent for other major players in the sector.""",
    },
    {
      'title': 'Global Markets React to Interest Rate Hike',
      'subtitle': "Central banks' decision to raise rates impacts stock and bond markets worldwide.",
      'imageUrl': 'https://via.placeholder.com/150',
      'source': 'Reuters',
      'publishedDate': '2024-03-14 09:00 AM',
      'content': """Global financial markets are experiencing significant volatility following the latest interest rate hike by major central banks. The coordinated effort aims to curb persistent inflation, but concerns are rising about the potential impact on economic growth. \n\nStock markets in New York, London, and Tokyo saw sharp declines, with technology and growth stocks being particularly hard hit. Bond yields, on the other hand, surged as investors adjusted to the new interest rate environment. \n\nAnalysts are divided on the long-term effects of these rate hikes. Some believe they are necessary to restore price stability, while others fear they could trigger a global recession. The coming weeks will be crucial as investors and businesses assess the full implications of these monetary policy changes.""",
    },
    {
      'title': 'Renewable Energy Stocks Soar',
      'subtitle': 'Increased investment and favorable policies drive clean energy sector.',
      'imageUrl': 'https://via.placeholder.com/150',
      'source': 'Bloomberg',
      'publishedDate': '2024-03-13 11:45 AM',
      'content': """The renewable energy sector is experiencing an unprecedented boom, with stock prices of leading solar, wind, and battery storage companies reaching new highs. This surge is primarily driven by increased government investment in green infrastructure and a growing global commitment to reducing carbon emissions. \n\nNew policies and incentives in key markets are making renewable energy projects more attractive to investors. Additionally, technological advancements are continually lowering the cost of clean energy production, further boosting its competitiveness against traditional fossil fuels. \n\nExperts predict that the growth in this sector will continue for the foreseeable future, as countries strive to meet ambitious climate targets and transition to a more sustainable energy landscape. This trend presents significant opportunities for investors looking to align their portfolios with environmental, social, and governance (ESG) principles.""",
    },
  ];

  // You can add methods here to fetch data from services or update state
}
