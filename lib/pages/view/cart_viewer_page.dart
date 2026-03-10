import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/viewmodel/cart_management_provider.dart';

class CartViewerPage extends ConsumerWidget {
  const CartViewerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartManagementProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.deepOrange,
      ),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty 🍕",
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      "Pizza (${item.size.name.toUpperCase()})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Crust: ${item.crust}"),
                        if (item.addOns.isNotEmpty)
                          Text(
                            "Add-ons: ${item.addOns.map((e) => e.name).join(", ")}",
                          ),
                        const SizedBox(height: 4),
                        Text("Price: \$${item.price}"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        ref
                            .read(cartManagementProvider.notifier)
                            .removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // TOTAL
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${cart.totalPrice}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
