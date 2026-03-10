import 'package:flutter/material.dart';

class BurgersMenue extends StatefulWidget {
  const BurgersMenue({super.key});

  @override
  State<BurgersMenue> createState() => _BurgersMenueState();
}

class _BurgersMenueState extends State<BurgersMenue> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Burgers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delicious cheesy burgers waiting for you!',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  (BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    offset: const Offset(0, 4),

                  )),
                ],
              ),
              child: TextField(

                decoration: InputDecoration(
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
