import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart_provider.dart';
import '../providers/auth.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: loadedProduct.id,
            );
          },
          child: Hero(
            tag: loadedProduct.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(loadedProduct.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, loadedProduct, _) => IconButton(
              icon: Icon(
                loadedProduct.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () {
                loadedProduct.toogleFavoriteStatus(auth.token, auth.userId);
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                  loadedProduct.id, loadedProduct.price, loadedProduct.title);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item added to your cart!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(loadedProduct.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
