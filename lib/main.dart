import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_project/app.dart';
import 'package:provider_example_project/state_management/cart_provider.dart';
import 'package:provider_example_project/state_management/counter_provider_class.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}
