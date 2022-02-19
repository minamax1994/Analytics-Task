import 'package:flutter/material.dart';

import 'orders/orders_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Analytics Example App',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        tabBarTheme: const TabBarTheme(labelColor: AppColors.secondary),
      ),
      home: OrdersScreen(),
    );
  }
}
