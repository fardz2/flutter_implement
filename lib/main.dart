import 'package:coba/controlller/product_list_provider.dart';
import 'package:coba/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductListProvider(),
        child: const MaterialApp(
          home: Scaffold(
            body: Homepage(),
          ),
        ));
  }
}
