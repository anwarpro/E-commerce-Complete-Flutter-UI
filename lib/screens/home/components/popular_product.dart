import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/products_bloc.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<ShopApiBloc, ShopApiState>(
              builder: (context, state) {
            if (state is ShopApiLoadInProgress) {
              return CircularProgressIndicator();
            }
            if (state is ProductsLoadSuccess) {
              return Row(
                children: [
                  ...List.generate(
                    state.products.length,
                    (index) {
                      return ProductCard(product: state.products[index]);
                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              );
            }
            return Text('Oops something went wrong!');
          }),
        )
      ],
    );
  }
}
