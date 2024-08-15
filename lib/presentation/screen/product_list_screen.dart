import 'package:bakery/data/constant.dart';
import 'package:bakery/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bakery 🥖")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: appData.length,
            itemBuilder: (context, index) {
              final data = appData[index];
              return ProductCard(data: data);
            }),
      ),
    );
  }
}
