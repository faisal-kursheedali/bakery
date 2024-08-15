import 'package:bakery/provider/cart_provider.dart';
import 'package:bakery/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>().wishlist;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish list ❤️"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 247, 178, 178),
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          if (wishlist.isNotEmpty) {
            context.read<WishlistProvider>().clearWishlist();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("All items removed from Wish list"),
              ),
            );
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: wishlist.isEmpty
            ? const Center(
                child: Text("No item in Wish list"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 20),
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final data = wishlist[index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 2.0,
                            child: Image.network(
                              data["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${data["price"].toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.shopping_bag,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CartProvider>()
                                          .addToCart(data);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text("Item added to cart"),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.heart_broken,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<WishlistProvider>()
                                          .removeFromWishlist(data);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              "Item removed from Wish list"),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
