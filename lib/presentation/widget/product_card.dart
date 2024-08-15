import 'package:bakery/provider/cart_provider.dart';
import 'package:bakery/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Image.network(
                data["image"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data["title"],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            "₹${data["price"].toString()}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addToCart(data);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Item added to cart"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: Color.fromARGB(255, 93, 172, 236)),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              IconButton(
                  onPressed: () {
                    bool isAdded =
                        context.read<WishlistProvider>().addToWishlist(data);
                    isAdded
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text("Item added to Wish list"),
                            ),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.grey,
                              content: Text("Item already added to Wish list"),
                            ),
                          );
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30,
                  ))
            ],
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
