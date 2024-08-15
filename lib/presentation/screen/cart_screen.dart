import 'package:bakery/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart 🛍️"),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: const Color.fromARGB(255, 247, 178, 178),
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          if (cart.isNotEmpty) {
            context.read<CartProvider>().clearCart();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("All items removed from Cart"),
              ),
            );
          }
        },
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text("No item in Cart"),
            )
          : ListView.builder(
              itemCount: cart.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final data = cart[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data['image']),
                      radius: 30,
                    ),
                    title: Text(
                      data['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("₹ ${data["price"]}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CartProvider>().removeFromCart(data);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Item removed from cart"),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
