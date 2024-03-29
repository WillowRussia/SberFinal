import 'package:flutter/material.dart';
import 'package:sber_final/constants.dart';


class Product {
  final String image, title, description,path,size;
  final int price, id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color, required this.path });
}

List<Product> products = [
  Product(
      id: 3,
      title: "Рубашка с тыквой",
      price: 1450,
      size: "XL",
      description: dummyText,
      image: "assets/products/scremer_rubashka.png",
      color: Color(0xFF989493), path: "assets/glb/scremer_rubashka.glb"),
  Product(
      id: 4,
      title: "Шкаф",
      price: 899,
      size: "121 cm",
      description: dummyText,
      image: "assets/products/shkaf.png",
      color: Color(0xFFE6B398), path: "assets/glb/shkaf.glb"),
  Product(
      id: 5,
      title: "Кофта с M&M",
      price: 234,
      size: "L",
      description: dummyText,
      image: "assets/products/mm_shirt.png",
      color: Color(0xFFFF496C), path: "assets/glb/mm_shirt.glb"),
  Product(
    id: 6,
    title: "Телевизор 4К",
    price: 25099,
    size: "50 cm",
    description: dummyText,
    image: "assets/products/tv.png",
    color: Color(0xFFAEAEAE), path: "assets/glb/tv.glb",
  ),
  Product(
    id: 8,
    title: "Поло в клетку",
    price: 799,
    size: "XL",
    description: dummyText,
    image: "assets/products/t_shirt.png",
    color: Color(0xFF003153), path: "assets/glb/t_shirt.glb",
  ),
  Product(
    id: 7,
    title: "Аниме футболка",
    price: 3699,
    size: "XLL",
    description: dummyText,
    image: "assets/products/white.png",
    color: Color(0xFF3B3C36), path: "assets/glb/temnaa_kurtka.glb",
  ),

  Product(
      id: 1,
      title: "Рубашка с брызгами",
      price: 599,
      size: "X",
      description: dummyText,
      image: "assets/products/speral_rubashka.png",
      color: Color(0xFF3D82AE), path: "ssets/glb/speral_rubashka.glb"),
  Product(
      id: 2,
      title: "Клетчетая рубашка",
      price: 1009,
      size: "XL",
      description: dummyText,
      image: "assets/products/orandgeva_rubashka.png",
      color: Color(0xFFD3A984), path: "assets/glb/orandgeva_rubashka.glb"),

];

String dummyText =
    "Очень важный текст, котрый ничего не значит, но тут могло бы быть подробнейшее описание товара. А так я делаю все что в моих силах. Надеюсь, что удостоюсь чести попасть на стажировку";
