import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';

class OrderItem {
  final MenuModel menu;
  int quantity;

  OrderItem({required this.menu, this.quantity = 1});

  // Getter agar UI tidak error
  String get name => menu.name;

  int get price => menu.getDiscountedPrice();

  int get originalPrice => menu.price;

  int get totalPrice => price * quantity;
}

class OrderCubit extends Cubit<List<OrderItem>> {
  OrderCubit() : super([]);

  void addToOrder(MenuModel menu) {
    final index = state.indexWhere((item) => item.menu.id == menu.id);

    if (index != -1) {
      state[index].quantity++;
      emit(List.from(state));
    } else {
      emit([...state, OrderItem(menu: menu, quantity: 1)]);
    }
  }

  void removeFromOrder(MenuModel menu) {
    final updated = List<OrderItem>.from(state)
      ..removeWhere((item) => item.menu.id == menu.id);
    emit(updated);
  }

  void updateQuantity(MenuModel menu, int newQty) {
    final index = state.indexWhere((item) => item.menu.id == menu.id);

    if (index != -1) {
      if (newQty <= 0) {
        removeFromOrder(menu);
        return;
      }
      state[index].quantity = newQty;
      emit(List.from(state));
    }
  }

  int getTotalPrice() {
    int total = 0;
    for (final item in state) {
      total += item.totalPrice;
    }
    return total;
  }

  void clearOrder() {
    emit([]);
  }
}
