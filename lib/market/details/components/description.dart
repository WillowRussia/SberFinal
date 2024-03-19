import 'package:flutter/material.dart';
import 'package:sber_final/market/models/Product.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5, color: Colors.black),
      ),
    );
  }
}
