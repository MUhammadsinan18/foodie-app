import '../providers/viewmodel/cart_state.dart';

class CartItem {
  final PizzaSize size;
  final List<PizzaAddsOn> addOns;
  final String crust;
  final double price;


  CartItem({
    required this.size,
    required this.addOns,
    required this.crust,
    required this.price,
  });
}
