import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../models/cart_item.dart";

//enums
enum PizzaAddsOn { extraCheese, extraMushrooms, extraFalafel }

enum PizzaSize { small, medium, large }

//cart State
class CartState {
  final PizzaSize? selectedsize;
  final List<PizzaAddsOn>? selectedaddson;
  final String? selectedCrust;
  final double? totalPrice;

  final List<CartItem> items;

  CartState({
    this.selectedsize,
    this.selectedCrust,
    this.selectedaddson = const [],
    this.totalPrice,
    this.items=const[],
  });
}

//state notifier
class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState());

  //function for price and size
  void selectedsize(PizzaSize size) {
    double? price = state.totalPrice;
    if (size == PizzaSize.small) {
      price = 8;
    } else if (size == PizzaSize.medium) {
      price = 12;
    } else if (size == PizzaSize.large) {
      price = 16;

    }
    state = CartState(
      selectedsize: size,
      selectedCrust: state.selectedCrust,
      selectedaddson: state.selectedaddson,
      totalPrice: price,
      items: state.items,

    );
  }

  void selectedaddson(PizzaAddsOn addOn) {
    final currentAddOns = state.selectedaddson ?? [];
    final updatedAddOns = [...currentAddOns];
    double price = state.totalPrice ?? 0;

    if (updatedAddOns.contains(addOn)) {
      updatedAddOns.remove(addOn);
      price -= 2; // remove price
    } else {
      updatedAddOns.add(addOn);
      price += 2; // add price
    }
    state = CartState(
      selectedsize: state.selectedsize,
      selectedaddson: updatedAddOns,
      selectedCrust: state.selectedCrust,
      totalPrice: price,
      items: state.items,
    );
  }
  void updatedCrust(String crust)

  {
    double price=state.totalPrice ?? 0;
    if (crust=='Stuffed'){
    price+=3;
    }
    state=CartState(
      selectedaddson: state.selectedaddson,
      selectedCrust:crust,
      selectedsize: state.selectedsize,
      totalPrice: price,
      items: state.items,


    );
  }


}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(),
);
