import 'package:json_annotation/json_annotation.dart';

part 'order_history_response.g.dart';

@JsonSerializable()
class OrderOutputModel {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final DateTime registered;

  double get priceValue => double.parse(price.substring(1).replaceAll(",", ""));

  OrderOutputModel(
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  );

  factory OrderOutputModel.fromJson(Map<String, dynamic> json) => _$OrderOutputModelFromJson(json);
}
