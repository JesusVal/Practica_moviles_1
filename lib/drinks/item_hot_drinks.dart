import 'package:estructura_practica_1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  ProductHotDrinks drink;
  bool isLiked;

  @override
  void initState() {
    drink = widget.drink;
    isLiked = drink.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("${widget.drink.productTitle}"),
      decoration: BoxDecoration(color: colorDrakGray),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: MediaQuery.of(context).size.height / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              bottom: 20,
              right: MediaQuery.of(context).size.width / 2,
              left: 20,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Café"),
                    Text("${drink.productTitle}"),
                    Text("${drink.productPrice}")
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              bottom: 20,
              right: 20,
              left: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                drink.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 3,
              bottom: 0,
              right: 5,
              left: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  color: isLiked ? Colors.red : Colors.black,
                  onPressed: () {
                    setLiked();
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setLiked() {
    isLiked = (isLiked) ? false : true;
  }
}
