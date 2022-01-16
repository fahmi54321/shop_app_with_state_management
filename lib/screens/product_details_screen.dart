import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {

  static const String routeName = 'product_details';

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
