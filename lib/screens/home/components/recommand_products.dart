import 'package:flutter/material.dart';
import 'package:food/models/FoodProducts.dart';
import 'package:food/models/Product.dart';
import 'package:food/screens/details/details_screen.dart';
import 'package:food/screens/details2/details_screen.dart';
import 'package:food/screens/home/components/product_card.dart';

import '../../../size_config.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key key,
    @required this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<FoodProduct> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen2(
                    product: products[index],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
