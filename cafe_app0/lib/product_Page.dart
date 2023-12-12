import 'package:flutter/material.dart';

import 'utility/paddingsAndMarjins.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final List<UrunSayfasi> _items;
  @override
  void initState() {
    super.initState();
    _items = [
      UrunSayfasi(
          imagePath: 'assets/flatwhite.jpg', title: 'Flat white', price: 75),
      UrunSayfasi(
          imagePath: 'assets/beyazkahve.jpg', title: 'Latte', price: 70),
      UrunSayfasi(
          imagePath: 'assets/chocolatecake.jpg',
          title: 'Çikolatalı Kek',
          price: 60),
      UrunSayfasi(
          imagePath: 'assets/kuruvasan.jpg', title: 'Kruvasan', price: 20),
      UrunSayfasi(imagePath: 'assets/macaron.jpg', title: 'Makaron', price: 65),
      UrunSayfasi(imagePath: 'assets/oreo.jpg', title: 'Kurabiye', price: 45),
      UrunSayfasi(imagePath: 'assets/pancake.jpg', title: 'Pancake', price: 50),
      UrunSayfasi(imagePath: 'assets/turkishtea.jpg', title: 'Çay', price: 10),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('-  MENÜ  -'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        padding: paddingUtility().paddingAnaCard,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10,
            margin: marjinUtility().cardMarjinBottomandTop,
            child: Padding(
              padding: paddingUtility().paddingImage,
              child: Column(
                children: [
                  Image.asset(
                    _items[index].imagePath,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: paddingUtility().paddingImageText,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_items[index].title),
                        Text('${_items[index].price} TL'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UrunSayfasi {
  final String imagePath;
  final String title;
  final double price;

  UrunSayfasi(
      {required this.imagePath, required this.title, required this.price});
}


