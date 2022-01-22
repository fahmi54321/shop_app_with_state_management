import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/produk_overview_screens.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';
import './providers/product_providers.dart';
import './providers/cart_providers.dart';
import './providers/order_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value( //todo 3 (finish)
          value: OrderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          primaryTextTheme: TextTheme(
            caption: TextStyle(color: Colors.white),
          ),
        ),
        home: ProductOverviewScreens(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
