import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_project/state_management/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Cart'),
            const SizedBox(height: 32),
            Consumer<CartProvider>(
              builder: (context, value, child) => Text(value.total.toString()),
            ),
            const SizedBox(height: 16),
            Consumer<CartProvider>(
              builder: (context, value, child) => Text(value.count.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
