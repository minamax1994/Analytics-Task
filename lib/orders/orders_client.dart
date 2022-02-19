import 'dart:convert';

import 'package:analytics_app/utils/api_result.dart';
import 'package:analytics_app/utils/app_logger.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/order_history_response.dart';

class OrdersClient {
  final _logger = LoggerWithTag("OrdersClient", DevLogger());

  Future<ApiResult<List<OrderOutputModel>>> getOrders() async {
    /// Simulate API call and parse response JSON
    await Future.delayed(const Duration(seconds: 2));
    _logger.info(message: "Loading JSON Response");
    final response = await rootBundle.loadString('assets/orders.json');
    _logger.info(message: "Parsing JSON Response");
    final output = (json.decode(response) as List).map((i) => OrderOutputModel.fromJson(i)).toList();
    return ApiResult.success(output);
  }
}
