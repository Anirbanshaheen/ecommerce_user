import 'package:ecommerce_user/customwidgets/main_drawer.dart';
import 'package:ecommerce_user/customwidgets/product_item.dart';
import 'package:ecommerce_user/pages/cart_page.dart';
import 'package:ecommerce_user/providers/cart_provider.dart';
import 'package:ecommerce_user/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  static const String routeName = '/product_list';

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductProvider _productProvider;
  late CartProvider _cartProvider;

  ///  Another method, initState which is used for when any thing would call only one time.

  @override
  void didChangeDependencies() {
    _productProvider = Provider.of<ProductProvider>(context);
    _cartProvider = Provider.of<CartProvider>(context);
    _productProvider.getAllProducts();
    _cartProvider.getAllCartItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
        children: _productProvider.productList.map((e) => ProductItem(e)).toList(),
      ),
    );
  }
}