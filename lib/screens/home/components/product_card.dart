import 'package:flutter/material.dart';
import 'package:food/components/title_text.dart';
import 'package:food/models/FoodProducts.dart';
import 'package:food/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final FoodProduct product;
  final Function press;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(30)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: FadeInImage.assetNetwork(
                  image: product.img ?? "https://ibb.co/D9tqQBS",
                  placeholder: "assets/spinner.gif",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                // i added Expanded for removing render flex..
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultSize),
                  child: TitleText(title: product.name),
                ),
              ),
              // SizedBox(height: defaultSize / 2),
              // Text("\$${product.nova}"),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
