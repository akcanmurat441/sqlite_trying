import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/shopping_provider.dart';
import 'screens/shopping_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingListState(),
      child: MaterialApp(
        title: 'Shopping List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const ShoppingListScreen(),
      ),
    );
  }
}
