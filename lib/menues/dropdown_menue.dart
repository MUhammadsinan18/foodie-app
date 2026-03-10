import 'package:flutter/material.dart';
import 'package:foodieapp/menues/selection_menue.dart';

class DropdownMenue extends StatefulWidget {
  final String tittle;
  final String properties;
  final double price;
  final String imageurl;
  const DropdownMenue({
    super.key,
    required this.tittle,
    required this.properties,
    required this.imageurl,
    required this.price,
  });

  @override
  State<DropdownMenue> createState() => _DropdownMenueState();
}

class _DropdownMenueState extends State<DropdownMenue> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Image.asset(widget.imageurl, height: 100, width: 128),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tittle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.properties,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '\$${widget.price.toString()}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SelectionMenue(tittle: widget.tittle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
