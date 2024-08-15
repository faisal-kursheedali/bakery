import 'package:bakery/presentation/screen/home_screen.dart';
import 'package:bakery/provider/cart_provider.dart';
import 'package:bakery/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 93, 172, 236)),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(centerTitle: true)
            // primaryColor: const Color.fromARGB(255, 93, 172, 236)
            ),
        home: const HomeScreen(),
      ),
    );
  }
}
