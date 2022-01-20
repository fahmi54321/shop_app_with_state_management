import 'package:flutter/material.dart';
import '../widget/product_grid.dart';
import '../providers/product_providers.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // false berarti variabel ini tidak mengamati perubahan data pada class provider dan hanya memperoleh akses data dari provider
    final productProvider=Provider.of<ProductProvider>(context, listen: false); // todo 9

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton( // todo 1 buat popup menu button
            onSelected: (FilterOptions selectedValue) { // todo 3 implement item jika di klik
              if (selectedValue == FilterOptions.Favorites) { // todo 4 jika hanya menampilkan item favorites
                productProvider.showFavoritesOnly(); // todo 10
              } else { // todo 5 else untuk menampilkan semua item (next product_providers)
                productProvider.showAll(); //todo 11 (finish)
              }
            },
            itemBuilder: (_) => [ //todo 2 buat item opoup
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
      body: ProductsGrid(),
    );
  }
}
