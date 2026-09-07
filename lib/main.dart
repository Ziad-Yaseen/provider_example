import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_project/app.dart';
import 'package:provider_example_project/state_management/counter_provider_class.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}
