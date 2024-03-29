import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber_final/ai_screen/product.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              "assets/other/sber_tyn.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 130,left: 30, right: 0),
              child: Text("Я подобрала для вас актуальное предложение с помощью ии на основе ваших запросов",
                style: TextStyle(color: Colors.white, fontSize: 23,fontWeight: FontWeight.bold,  ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 560),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Products())),
              child: Text("Посмотреть",style: TextStyle(fontSize: 15),),),
            )
          ],

        ),
      ),
    );
  }
}
