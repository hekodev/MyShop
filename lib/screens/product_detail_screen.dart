import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName =
      '/product-detail-screen'; //Define routeName to be used in the routes map in main

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id !
    final loadProduct = Provider.of<ProductsProvider>(
      context,
      listen: false, //with false (and the default is true), this widget wont rebuild
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadProduct.title),
      ),
    );
  }
}
