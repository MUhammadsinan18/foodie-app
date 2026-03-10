import 'package:flutter/material.dart';
import 'package:foodieapp/menues/burgers_menue.dart';

class RowMenue extends StatefulWidget {
  final String tittle;
  final String image;

  const RowMenue({super.key, required this.tittle, required this.image});

  @override
  State<RowMenue> createState() => _RowMenueState();
}

class _RowMenueState extends State<RowMenue> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(

        padding: const EdgeInsets.fromLTRB(15,8,0,8),
        child: GestureDetector(
          onTap: (){
            if (widget.tittle.toLowerCase().contains('burger'))
            {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>BurgersMenue()));

            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow:[BoxShadow(color: Colors.black26,blurRadius: 5)]
          
            ),
            child: Column(
              children: [
                Image.asset(widget.image,height: 100,width: 100,),
                Text(widget.tittle,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15),),
          
              ],
            ),
          ),
        ),
      );

  }
}
