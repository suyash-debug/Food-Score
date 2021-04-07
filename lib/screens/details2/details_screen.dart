import 'package:flutter/material.dart';
import 'package:food/models/FoodProducts.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen2 extends StatelessWidget {
  final FoodProduct product;

  const DetailsScreen2({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: Body(product: product),
    );
  }
}

// class ProductDetailsArguments {
//   final FoodProduct product;

//   ProductDetailsArguments({@required this.product});
// }
