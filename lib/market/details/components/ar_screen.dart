

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:sber_final/market/models/Product.dart';
import 'package:sber_final/constants.dart';

class ArScreen extends StatelessWidget {
   const ArScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
    icon: SvgPicture.asset(
    'assets/icons/back.svg',
      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    ),
    onPressed: () => Navigator.pop(context),
    )),
      body: ModelViewer(src: product.path,ar: true,),
    );
  }
}


