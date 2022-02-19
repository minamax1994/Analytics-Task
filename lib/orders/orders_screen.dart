import 'package:analytics_app/orders/models/order_history_response.dart';
import 'package:analytics_app/theme/app_colors.dart';
import 'package:analytics_app/theme/app_styles.dart';
import 'package:analytics_app/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';
import 'widgets/orders_chart_view.dart';
import 'widgets/orders_info_view.dart';

class OrdersScreen extends StatelessWidget {
  final controller = OrdersController();

  OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadOrders();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: const CustomAppBar(
          title: "Orders",
          bottom: TabBar(
            indicator: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.primary, width: 2.0))),
            tabs: [
              Tab(text: "Info", icon: Icon(Icons.storage)),
              Tab(text: "Graph", icon: Icon(Icons.insights)),
            ],
          ),
        ),
        body: Obx(
          () {
            final state = controller.state;
            if (state is OrdersLoadedState) return OrdersView(orders: state.orders);
            if (state is OrdersInitialState) {
              if (state.isLoading.value) return const LoadingView();
              if (state.errorMessage.value != null) return Center(child: Text(state.errorMessage.value!));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class OrdersView extends StatelessWidget {
  const OrdersView({
    Key? key,
    required this.orders,
  }) : super(key: key);

  final List<OrderOutputModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const ScreenHeader(),
      subtitle: SizedBox(
        height: Get.height - 250,
        child: TabBarView(
          children: [
            OrdersInfoView(orders: orders),
            OrdersChartView(orders: orders),
          ],
        ),
      ),
    );
  }
}

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      title: Text(
        "Hey There!",
        style: AppStyles.subtitleStyle,
      ),
      subtitle: Text(
        "Here's Some Data About Your Order History.",
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(color: AppColors.secondary),
          ),
          SizedBox(height: 20),
          Text(
            "Loading your Data ...",
            style: AppStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }
}
