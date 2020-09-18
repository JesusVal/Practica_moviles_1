import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/cart/cart.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> products = {
    "BebidasCalientes": List<ProductHotDrinks>(),
    "Granos": List<ProductGrains>(),
    // "Postres": List<ProductDessert>(),
  };
  List<ProductItemCart> cartList = new List<ProductItemCart>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Cart(
                  productsList: cartList,
                );
              }));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          ItemHome(
            title: "Granos",
            image: "https://i.imgur.com/5MZocC1.png",
          ),
          ItemHome(
            title: "Postres",
            image: "https://i.imgur.com/fI7Tezv.png",
          ),
          ItemHome(
            // TODO: Al hacer clic, que muestre un snackbar de "Proximamente"
            title: "Tazas",
            image: "https://i.imgur.com/fMjtSpy.png",
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    // TODO: completar en navigator pasando los parametros a la pagina de HotDrinksPage

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
              drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS));
        },
      ),
    ).then((product) => _insertCart(product));
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => null),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => null),
    );
  }

  bool _insertCart(dynamic product) {
    if (product is ProductHotDrinks || product is ProductGrains) {
      cartList.add(
        ProductItemCart(
          productTitle: product.productTitle,
          productAmount: product.productAmount,
          productPrice: product.productPrice,
          productImage: product.productImage,
          productSize: product.getSize(),
          productLiked: product.liked,
        ),
      );
    }
    return true;
  }
}
