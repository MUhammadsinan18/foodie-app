import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/cart_item.dart';

class CartManagementState {
  final List<CartItem> items;

  CartManagementState({required this.items});

  double get totalPrice {
    double total = 0;
    for (final item in items) {
      total += item.price;
    }
    return total;
  }
}
class CartManagementNotifier
    extends StateNotifier<CartManagementState> {
  CartManagementNotifier()
      : super(CartManagementState(items: []));

  void addToCart(CartItem item) {
    state = CartManagementState(
      items: [...state.items, item],
    );
  }

  void removeFromCart(int index) {
    final updatedItems = [...state.items]..removeAt(index);
    state = CartManagementState(items: updatedItems);
  }

  void clearCart() {
    state = CartManagementState(items: []);
  }
}
final cartManagementProvider =
StateNotifierProvider<CartManagementNotifier, CartManagementState>(
      (ref) => CartManagementNotifier(),
);
