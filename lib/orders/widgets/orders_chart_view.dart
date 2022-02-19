import 'package:analytics_app/orders/models/order_history_response.dart';
import 'package:analytics_app/orders/models/order_series.dart';
import 'package:analytics_app/orders/models/orders_extension.dart';
import 'package:analytics_app/theme/app_colors.dart';
import 'package:analytics_app/ui/fade_in_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OrdersChartView extends StatelessWidget {
  final List<OrderOutputModel> orders;

  const OrdersChartView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderSeries, String>> series = [
      charts.Series(
        id: "Orders",
        data: orders.series,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(AppColors.secondary),
        domainFn: (OrderSeries series, _) => DateFormat("MMM\nyy").format(series.date),
        measureFn: (OrderSeries series, _) => series.orderCount,
      ),
    ];
    return FadeInCard(child: charts.BarChart(series, animate: true));
  }
}
