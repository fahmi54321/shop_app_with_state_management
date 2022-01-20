import 'package:flutter/material.dart';
import '../widget/product_grid.dart';
import '../providers/product_providers.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreens extends StatefulWidget {
  @override
  State<ProductOverviewScreens> createState() => _ProductOverviewScreensState();
}

class _ProductOverviewScreensState extends State<ProductOverviewScreens> {
  @override
  Widget build(BuildContext context) {
    var _showOnlyFavorites = false; //todo 1

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() { //todo 2
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites), //todo 3 (next product_grid)
    );
  }
}
