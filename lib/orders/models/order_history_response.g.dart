// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderOutputModel _$OrderOutputModelFromJson(Map<String, dynamic> json) =>
    OrderOutputModel(
      json['id'] as String,
      json['isActive'] as bool,
      json['price'] as String,
      json['company'] as String,
      json['picture'] as String,
      json['buyer'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['status'] as String,
      DateTime.parse(json['registered'] as String),
    );

Map<String, dynamic> _$OrderOutputModelToJson(OrderOutputModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'price': instance.price,
      'company': instance.company,
      'picture': instance.picture,
      'buyer': instance.buyer,
      'tags': instance.tags,
      'status': instance.status,
      'registered': instance.registered.toIso8601String(),
    };
