
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_module/screens/news_screen.dart';
import 'package:ui_module/screens/overview_screen.dart';
import 'package:ui_module/screens/my_page_screen.dart';
import 'package:ui_module/screens/stocks_screen.dart';
import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/home_viewmodel.dart';

/// A screen that displays the main content of the app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    OverviewScreen(),
    StocksScreen(),
    NewsScreen(),
    MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(homeViewModel.selectedIndex),
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
              currentIndex: homeViewModel.selectedIndex,
              onTap: homeViewModel.onItemTapped,
            ),
          );
        },
      ),
    );
  }
}
