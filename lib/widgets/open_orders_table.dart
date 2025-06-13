import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';
import '../models/order.dart';

class OpenOrdersTable extends StatelessWidget {
  const OpenOrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrdersProvider>();
    final orders = provider.paginatedOrders;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: const [
                      _HeaderCell('Time'),
                      _HeaderCell('Client'),
                      _HeaderCell('Ticker'),
                      _HeaderCell('Side'),
                      _HeaderCell('Product'),
                      _HeaderCell('Qty (Executed/Total)'),

                      _HeaderCell('Price'),
                      _HeaderCell('Actions'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...orders.map(
                    (order) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              _DataCell(order.time),
                              _DataCell(order.client),
                              _DataCell(order.ticker, isTicker: true),
                              _DataCell(
                                order.side == OrderSide.buy ? 'Buy' : 'Sell',
                                color:
                                    order.side == OrderSide.buy
                                        ? const Color(0xFF2563EB)
                                        : const Color(0xFFEF4444),
                              ),
                              _DataCell(_productString(order.product)),
                              _DataCell(
                                '${order.executedQty}/${order.totalQty}',
                              ),

                              _DataCell(order.price.toStringAsFixed(2)),
                              _ActionCell(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () => provider.cancelAll(),
                    child: const Text('Cancel all'),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed:
                            provider.currentPage > 1
                                ? provider.previousPage
                                : null,
                        child: const Text(
                          'Previous',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('Page ${provider.currentPage}'),
                      ),
                      TextButton(
                        onPressed:
                            provider.currentPage < provider.totalPages
                                ? provider.nextPage
                                : null,
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String label;
  const _HeaderCell(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF374151),
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String value;
  final Color? color;
  final bool isTicker;
  const _DataCell(this.value, {this.color, this.isTicker = false});

  @override
  Widget build(BuildContext context) {
    if (isTicker) {
      final showIcon = value == 'RELIANCE' || value == 'ASIANPAINT';
      return Container(
        constraints: const BoxConstraints(minWidth: 100),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            if (showIcon) ...[
              const SizedBox(width: 2),
              Icon(Icons.cell_tower, color: Colors.blue, size: 18),
            ],
          ],
        ),
      );
    }
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: color ?? Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _ActionCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 140),
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.settings_ethernet_outlined,
              color: Color(0xFFEF4444),
            ),
            onPressed: () {},
            tooltip: 'Cancel',
          ),
        ],
      ),
    );
  }
}

String _productString(OrderProduct product) {
  switch (product) {
    case OrderProduct.cnc:
      return 'CNC';
    case OrderProduct.nrml:
      return 'NRML';
    case OrderProduct.intraday:
      return 'INTRADAY';
  }
}
