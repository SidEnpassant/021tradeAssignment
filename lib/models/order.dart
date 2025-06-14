enum OrderSide { buy, sell }

enum OrderProduct { cnc, nrml, intraday }

class Order {
  final String time;
  final String client;
  final String ticker;
  final String code;
  final OrderSide side;
  final OrderProduct product;
  final int executedQty;
  final int totalQty;
  final double price;

  Order({
    required this.time,
    required this.client,
    required this.ticker,
    required this.code,
    required this.side,
    required this.product,
    required this.executedQty,
    required this.totalQty,
    required this.price,
  });
}
