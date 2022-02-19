import 'package:analytics_app/orders/models/order_history_response.dart';
import 'package:analytics_app/orders/orders_client.dart';
import 'package:analytics_app/utils/app_logger.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final _logger = LoggerWithTag("OrdersController", DevLogger());
  final _client = OrdersClient();
  final _state = Rx<OrdersState>(OrdersInitialState());

  OrdersState get state => _state.value;

  Future<void> loadOrders() async {
    final st = _ensureState<OrdersInitialState>();
    st.isLoading.value = true;
    _logger.info(message: "Fetching Orders");
    final result = await _client.getOrders();
    if (!result.isSuccess) {
      _logger.info(message: "Fetching Orders Failed: " + result.errorMessage!);
      _setState(OrdersInitialState()..errorMessage.value = result.errorMessage);
      return;
    }
    _logger.info(message: "Fetching Orders Succeeded");
    _setState(OrdersLoadedState(result.outputModel!));
  }

  void _setState(OrdersState newState) => _state.value = newState;

  TState _ensureState<TState>() {
    if (_state.value is! TState) throw Exception("Unexpected State");
    return _state.value as TState;
  }
}

abstract class OrdersState {}

class OrdersInitialState implements OrdersState {
  final isLoading = RxBool(false);
  final errorMessage = RxnString();
}

class OrdersLoadedState extends OrdersInitialState {
  final List<OrderOutputModel> orders;

  OrdersLoadedState(this.orders);
}
