import 'package:flutter/material.dart';
import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {
  final int _rowsPerPage = 4;
  int _currentPage = 1;
  final List<Order> _orders = [
    Order(
      time: '08:14:31',
      client: 'AAA001',
      ticker: 'RELIANCE',
      code: 'AAA001',
      side: OrderSide.buy,
      product: OrderProduct.cnc,
      executedQty: 50,
      totalQty: 100,
      price: 250.50,
    ),
    Order(
      time: '08:14:31',
      client: 'AAA003',
      ticker: 'MRF',
      code: 'AAA003',
      side: OrderSide.buy,
      product: OrderProduct.nrml,
      executedQty: 10,
      totalQty: 20,
      price: 2700.00,
    ),
    Order(
      time: '08:14:31',
      client: 'AAA002',
      ticker: 'ASIANPAINT',
      code: 'AAA002',
      side: OrderSide.buy,
      product: OrderProduct.nrml,
      executedQty: 10,
      totalQty: 30,
      price: 1500.60,
    ),
    Order(
      time: '08:14:31',
      client: 'AAA002',
      ticker: 'TATAINVEST',
      code: 'AAA002',
      side: OrderSide.sell,
      product: OrderProduct.intraday,
      executedQty: 10,
      totalQty: 10,
      price: 2300.10,
    ),
  ];

  int get currentPage => _currentPage;
  int get rowsPerPage => _rowsPerPage;
  int get totalPages => (_orders.length / _rowsPerPage).ceil();

  List<Order> get paginatedOrders {
    final start = (_currentPage - 1) * _rowsPerPage;
    final end = (_currentPage * _rowsPerPage).clamp(0, _orders.length);
    return _orders.sublist(start, end);
  }

  void nextPage() {
    if (_currentPage < totalPages) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      notifyListeners();
    }
  }

  void cancelAll() {
    _orders.clear();
    notifyListeners();
  }
}
