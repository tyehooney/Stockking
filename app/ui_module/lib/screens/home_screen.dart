
import 'package:flutter/material.dart';
import 'package:ui_module/screens/news_screen.dart';
import 'package:ui_module/screens/overview_screen.dart';
import 'package:ui_module/screens/my_page_screen.dart';
import 'package:ui_module/screens/stocks_screen.dart';
import 'package:ui_module/utils/theme.dart';

/// A screen that displays the main content of the app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    OverviewScreen(),
    StocksScreen(),
    NewsScreen(),
    MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.textPrimary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            activeIcon: Icon(Icons.show_chart),
            label: 'Stocks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            activeIcon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'My Page',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
