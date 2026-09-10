import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_project/state_management/counter_provider_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    log('Screen rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Spacer(),
            const Text('You have pushed the button this many times:'),
            Text(
              '${Provider.of<Counter>(context).counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: .center,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<Counter>().decrementCounter();
                  },
                  child: Text('Decrement'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<Counter>().reset();
                  },
                  child: Text('Reset'),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
