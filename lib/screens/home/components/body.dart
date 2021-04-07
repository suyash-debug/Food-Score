import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/components/title_text.dart';
import 'package:food/cubit/product_cubit.dart';
import 'package:food/screens/home/components/recommand_products.dart';
import 'package:food/services/fetchCategories.dart';
import 'package:food/size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = BlocProvider.of<ProductCubit>(context);

    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: "Browse by Category",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.data,
                    )
                  : Center(
                      child: Image.asset('assets/ripple.gif'),
                    ),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: "Recommands for you",
              ),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is ProductInitial) {
                  return buildInitialInput(context);
                } else if (state is ProductLoading) {
                  return Center(
                    child: Image.asset('assets/ripple.gif'),
                  );
                } else if (state is ProductLoaded) {
                  print(state.foodProducts[0].name);
                  return RecommandProducts(
                    products: state.foodProducts,
                  );
                } else {
                  // (state is WeatherError)
                  return buildInitialInput(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInitialInput(buildContext) {
    return RaisedButton(
      onPressed: () {
        final ProductCubit productCubit =
            BlocProvider.of<ProductCubit>(buildContext);

        productCubit.getFoodProducts();
      },
    );
  }
}
