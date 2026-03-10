import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/material.dart';
import 'package:foodieapp/providers/viewmodel/cart_state.dart';

import '../models/cart_item.dart';
import '../providers/viewmodel/cart_management_provider.dart';

class SelectionMenue extends ConsumerStatefulWidget {
  final String tittle;
  const SelectionMenue({super.key, required this.tittle});
  @override
  ConsumerState<SelectionMenue> createState() => _SelectionMenueState();
}

class _SelectionMenueState extends ConsumerState<SelectionMenue> {
  @override
  Widget build(BuildContext context) {


    return ElevatedButton.icon(
      onPressed: () {
        PizzaSize? tempSize = ref.read(cartProvider).selectedsize;
        List<PizzaAddsOn> tempAddOns = List.from(
          ref.read(cartProvider).selectedaddson ?? [],
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                widget.tittle,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              content: StatefulBuilder(
                builder: (context, setState) {
                  double calculateTempPrice() {
                    double price = 0;

                    if (tempSize == PizzaSize.small) price = 10;
                    if (tempSize == PizzaSize.medium) price = 11;
                    if (tempSize == PizzaSize.large) price = 12;

                    if (tempAddOns.contains(PizzaAddsOn.extraCheese)) price += 3;
                    if (tempAddOns.contains(PizzaAddsOn.extraMushrooms)) price += 1;

                    return price;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Please select the size',
                          style: TextStyle(fontSize: 20),
                        ),
                        //large box
                        RadioListTile(
                          activeColor: Colors.deepOrangeAccent,
                          title: Text("Large"),
                          secondary: Text(
                            '\$12',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          value: PizzaSize.large,
                          groupValue: tempSize,
                          onChanged: (value) {
                            setState(() {
                              tempSize = value;
                            });
                          },
                        ),
                    
                        //medium box
                        RadioListTile(
                          activeColor: Colors.deepOrangeAccent,
                          title: Text("Medium"),
                          secondary: Text(
                            '\$11',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          value: PizzaSize.medium,
                          groupValue: tempSize,
                          onChanged: (value) {
                            setState(() {
                              tempSize = value;
                            });
                          },
                    
                          //small box
                        ),
                        RadioListTile(
                          activeColor: Colors.deepOrangeAccent,
                    
                          title: Text("Small"),
                          secondary: Text(
                            '\$10',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          value: PizzaSize.small,
                          groupValue: tempSize,
                          onChanged: (value) {
                            setState(() {
                              tempSize = value;
                            });
                          },
                        ),
                        Divider(),
                        CheckboxListTile(
                          secondary: Text(
                            '\$3',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                    
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrangeAccent,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text("Extra Cheese"),
                          value: tempAddOns.contains(PizzaAddsOn.extraCheese),
                          onChanged: (_) {
                            setState(() {
                              if (tempAddOns.contains(PizzaAddsOn.extraCheese)) {
                                tempAddOns.remove(PizzaAddsOn.extraCheese);
                              } else {
                                tempAddOns.add(PizzaAddsOn.extraCheese);
                              }
                            });
                          },
                        ),
                        Divider(),
                        CheckboxListTile(
                          secondary: Text(
                            '\$1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrangeAccent,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text("Extra Mushrooms"),
                          value: tempAddOns.contains(PizzaAddsOn.extraMushrooms),
                          onChanged: (_) {
                            setState(() {
                              if (tempAddOns.contains(
                                PizzaAddsOn.extraMushrooms,
                              )) {
                                tempAddOns.remove(PizzaAddsOn.extraMushrooms);
                              } else {
                                tempAddOns.add(PizzaAddsOn.extraMushrooms);
                              }
                            });
                          },
                        ),
                        Divider(),
                        Text(
                          "Total: \$${calculateTempPrice()}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              actions: [

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed:() {
                            if (tempSize == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select a size")),
                              );
                              return;
                            }

                            double price = 0;

                            if (tempSize == PizzaSize.small) price = 10;
                            if (tempSize == PizzaSize.medium) price = 11;
                            if (tempSize == PizzaSize.large) price = 12;

                            if (tempAddOns.contains(PizzaAddsOn.extraCheese)) price += 3;
                            if (tempAddOns.contains(PizzaAddsOn.extraMushrooms)) price += 1;

                            final cartItem = CartItem(
                              size: tempSize!,
                              addOns: tempAddOns,
                              crust: 'Normal',
                              price: price,
                            );

                            ref
                                .read(cartManagementProvider.notifier)
                                .addToCart(cartItem);

                            Navigator.pop(context);
                          },



                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },

      label: Text(
        'ADD',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      icon: Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.zero,
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.zero,
          ),
        ),
      ),
    );
  }
}
