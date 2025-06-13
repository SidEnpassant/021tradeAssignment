import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/market_provider.dart';
import 'providers/orders_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TradeApp());
}

class TradeApp extends StatelessWidget {
  const TradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MarketProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trade App',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
