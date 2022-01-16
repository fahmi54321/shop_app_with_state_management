import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_providers.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product_details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct = Provider.of<ProductProvider>(
      context,
      listen: false, // false maksudnya tidak mentrigger update pada provider
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadProduct.title,
        ),
      ),
    );
  }
}
