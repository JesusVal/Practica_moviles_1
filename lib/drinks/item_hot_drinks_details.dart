import 'package:estructura_practica_1/cart/payment_view.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/utils/colors.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetail extends StatefulWidget {
  final ProductHotDrinks actualDrink;
  ItemHotDrinksDetail({Key key, @required this.actualDrink}) : super(key: key);

  @override
  _ItemHotDrinksDetailState createState() => _ItemHotDrinksDetailState();
}

class _ItemHotDrinksDetailState extends State<ItemHotDrinksDetail> {
  ProductHotDrinks actualDrink;
  ProductSize sizeProduct;

  @override
  void initState() {
    actualDrink = widget.actualDrink;
    sizeProduct = actualDrink.productSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(actualDrink.productTitle),
          backgroundColor: colorDarkBlue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [colorDarkOrange, colorLightOrange],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.network(
                            actualDrink.productImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: actualDrink.liked ? Colors.red : Colors.black,
                          onPressed: () {
                            setLike();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${actualDrink.productTitle}",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 30),
                Text(
                  "${actualDrink.productDescription}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Tamaño",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setSize(ProductSize.CH);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  color: (sizeProduct == ProductSize.CH)
                                      ? Colors.purple[200]
                                      : Colors.white10,
                                  child: Center(child: Text("CH")),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setSize(ProductSize.M);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  color: (sizeProduct == ProductSize.M)
                                      ? Colors.purple[200]
                                      : Colors.white10,
                                  child: Center(child: Text("M")),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setSize(ProductSize.G);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  color: (sizeProduct == ProductSize.G)
                                      ? Colors.purple[200]
                                      : Colors.white10,
                                  child: Center(child: Text("G")),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Precio",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Text(
                                "\$${actualDrink.productPrice}",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          actualDrink.productSize = sizeProduct;
                          actualDrink.productAmount++;
                          Navigator.of(context).pop(actualDrink);
                        },
                        child: Text(
                          "AGREGAR AL CARRITO",
                          style: TextStyle(color: colorWhite),
                        ),
                        color: colorDrakGray,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PaymentView(payment: true);
                              },
                            ),
                          );
                        },
                        child: Text(
                          "COMPRAR AHORA",
                          style: TextStyle(color: colorWhite),
                        ),
                        color: colorDrakGray,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void setSize(ProductSize size) {
    sizeProduct = size;
    actualDrink.productPrice = actualDrink.productPriceCalculator();
  }

  void setLike() {
    actualDrink.liked = (actualDrink.liked) ? false : true;
  }
}
