import 'package:analytics_app/orders/models/order_history_response.dart';
import 'package:analytics_app/orders/models/orders_extension.dart';
import 'package:analytics_app/theme/app_styles.dart';
import 'package:analytics_app/ui/fade_in_card.dart';
import 'package:flutter/material.dart';

class OrdersInfoView extends StatelessWidget {
  final List<OrderOutputModel> orders;

  const OrdersInfoView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInCard(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoTile(title: "Total Orders Count", subtitle: orders.count.toString()),
            InfoTile(title: "Average Order Price", subtitle: "\$" + orders.averagePrice.toStringAsFixed(2)),
            InfoTile(title: "Returned Orders Count", subtitle: orders.returnsCount.toString()),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        title: Text(title, style: AppStyles.primaryBoldStyle),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(subtitle, style: AppStyles.secondaryHeaderStyle),
        ),
      ),
    );
  }
}
