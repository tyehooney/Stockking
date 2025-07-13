import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:provider/provider.dart';
import 'package:ui_module/screens/home_screen.dart';
import 'package:ui_module/screens/login_screen.dart';
import 'package:ui_module/screens/splash_screen.dart';

import 'package:ui_module/utils/theme.dart';
import 'package:ui_module/viewmodels/home_viewmodel.dart';
import 'package:ui_module/viewmodels/login_viewmodel.dart';
import 'package:ui_module/viewmodels/my_page_viewmodel.dart';
import 'package:ui_module/viewmodels/news_details_viewmodel.dart';
import 'package:ui_module/viewmodels/news_viewmodel.dart';
import 'package:ui_module/viewmodels/overview_viewmodel.dart';
import 'package:ui_module/viewmodels/signup_viewmodel.dart';
import 'package:ui_module/viewmodels/stocks_details_viewmodel.dart';
import 'package:ui_module/viewmodels/stocks_viewmodel.dart';

import 'package:core_module/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CoreModule.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel(Supabase.instance.client)),
        ChangeNotifierProvider(create: (_) => SignupViewModel(Supabase.instance.client)),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => OverviewViewModel()),
        ChangeNotifierProvider(create: (_) => StocksViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => MyPageViewModel()),
        ChangeNotifierProvider(create: (_) => StocksDetailsViewModel()),
      ],
      child: MaterialApp(
        title: 'Stockking',
        theme: getAppTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
