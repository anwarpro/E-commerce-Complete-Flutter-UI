import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/bloc/products_bloc.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  Categories({required this.shopApiClient});

  final ShopApiClient shopApiClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShopApiBloc(
        productsApiClient: shopApiClient,
      )..add(CollectionFetchStarted()),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child:
            BlocBuilder<ShopApiBloc, ShopApiState>(builder: (context, state) {
          if (state is ShopApiLoadInProgress) {
            return CircularProgressIndicator();
          }
          if (state is CollectionLoadSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                state.collections.length,
                (index) => CategoryCard(
                  icon: "assets/icons/Flash Icon.svg",
                  text: state.collections[index].name,
                  press: () {},
                ),
              ),
            );
          }
          return Text('Oops something went wrong!');
        }),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
