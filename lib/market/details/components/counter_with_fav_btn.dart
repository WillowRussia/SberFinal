

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber_final/market/details/components/ar_screen.dart';
import 'package:sber_final/market/models/Product.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatefulWidget {


  const CounterWithFavBtn({super.key, required this.product});
  final Product product;

  @override
  State<CounterWithFavBtn> createState() => _CounterWithFavBtnState();
}

class _CounterWithFavBtnState extends State<CounterWithFavBtn> {
  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        SizedBox(width: 40),
        Text("AR режим -> ",style: TextStyle(color: Colors.black38),),
        Container(
          padding:EdgeInsets.all(0),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.camera,size: 17,color: Colors.white,),
            onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ArScreen(product: widget.product)));
          },),
        ),

        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
