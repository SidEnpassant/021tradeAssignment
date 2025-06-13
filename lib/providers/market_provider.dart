import 'package:flutter/material.dart';
import '../models/market_stat.dart';

class MarketProvider extends ChangeNotifier {
  final List<MarketStat> _stats = [
    MarketStat(name: 'SIGNORIA', value: '0.00'),
    MarketStat(name: 'NIFTY BANK', value: '52,323.30'),
    MarketStat(name: 'NIFTY FIN SERVICE', value: '25,255.75'),
    MarketStat(name: 'RELCHEMQ', value: '162.73'),
  ];

  List<MarketStat> get stats => _stats;
}
