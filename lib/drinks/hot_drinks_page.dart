import 'package:estructura_practica_1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
        backgroundColor: colorDarkBlue,
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ItemHotDrinks(drink: drinksList[index]),
            onTap: () {
              return Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => ItemHotDrinksDetail(
                            actualDrink: drinksList[index],
                          )))
                  .then((value) {
                if (value != null) {
                  Navigator.of(context).pop(value);
                }
              });
            },
          );
          /*return ItemHotDrinks(
            drink: drinksList[index],
          );*/
        },
      ),
    );
  }
}
