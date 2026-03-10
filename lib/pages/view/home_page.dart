import 'package:flutter/material.dart';
import 'package:foodieapp/menues/dropdown_menue.dart';
import 'package:foodieapp/menues/row_menue.dart';
import 'package:foodieapp/constants/variables.dart';

import 'cart_viewer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _PizzaListState();
}

class _PizzaListState extends State<HomePage> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        'assets/images/tittle_image.jpg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text(
                      'FOODIE EMPIRE',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Padding(

                    padding: const EdgeInsets.fromLTRB(5,8,10,0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartViewerPage(),
                          ),
                        );
                      },
                      child: CircleAvatar(

                        radius: 30,

                        backgroundImage: AssetImage(
                          'assets/images/delievery_image.jpg'

                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).primaryColor,
                    filled: true,
                    border: InputBorder.none,
                    enabledBorder: border,
                    focusedBorder: border,
                    hintText: '29 Hola Street , California, USA',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(232, 106, 18, 1),
                    ),
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      size: 30,
                      color: Color.fromRGBO(232, 106, 18, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final givenitems = items[index];
                    return RowMenue(
                      tittle: givenitems['tittle'] as String,
                      image: givenitems['imageurl'] as String,
                    );
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: pizzamenue.length,

                itemBuilder: (context, index) {
                  final dropitems = pizzamenue[index];
                  return DropdownMenue(
                    tittle: dropitems['tittle'] as String,
                    properties: dropitems['properties'] as String,
                    imageurl: dropitems['imageurl'] as String,
                    price: double.parse(
                      dropitems['price'].toString().replaceAll('\$', ''),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
