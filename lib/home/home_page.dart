import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_project/cart/cart_page.dart';
import 'package:provider_example_project/state_management/cart_provider.dart';
import 'package:provider_example_project/state_management/counter_provider_class.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    log('Screen rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Spacer(),
            const Text('You have pushed the button this many times:'),
            Consumer<Counter>(
              builder: (context, Counter counterValue, child) {
                log('We are only on consumer');
                return Text(
                  '${counterValue.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const Spacer(),
            Consumer<CartProvider>(
              builder: (context, value, child) => Text(value.total.toString()),
            ),
            const SizedBox(height: 16),
            Consumer<CartProvider>(
              builder: (context, value, child) => Text(value.count.toString()),
            ),
            const Text('----------------------------'),
            Selector<CartProvider, String>(
              builder: (context, value, child) {
                log('Just Changed');
                return Text(value);
              },
              selector: (context, value) => value.condition,
            ),
            const Text('----------------------------'),
            Row(
              mainAxisAlignment: .center,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<CartProvider>().decrement();
                  },
                  child: const Text('Decrement'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<CartProvider>().reset();
                  },
                  child: const Text('Reset'),
                ),
                const Spacer(flex: 2),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: const Text('Go to Cart Screen'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CartProvider>().changeCondition('the new condition');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
