import 'package:analytics_app/orders/models/order_history_response.dart';

import 'order_series.dart';

extension OrdersExtensions on List<OrderOutputModel> {
  int get count => length;

  double get averagePrice => fold(0.0, (p, e) => (p as double) + e.priceValue) / count;

  int get returnsCount => where((e) => e.status == "RETURNED").toList().length;

  List<OrderSeries> get series {
    final data = <DateTime, int>{};
    for (final order in this) {
      final month = DateTime(order.registered.year, order.registered.month, 0, 0, 0, 0, 0, 0);
      if (data[month] != null) {
        data[month] = data[month]! + 1;
      } else {
        data[month] = 1;
      }
    }
    final list = data.entries.map((e) => OrderSeries(e.key, e.value)).toList();
    list.sort((a, b) => a.date.compareTo(b.date));
    return list;
  }
}
