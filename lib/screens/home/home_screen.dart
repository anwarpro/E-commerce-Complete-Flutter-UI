import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/bloc/products_bloc.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  final ShopApiClient shopApiClient = ShopApiClient.create();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocProvider(
        create: (_) => ShopApiBloc(
          productsApiClient: shopApiClient,
        )..add(ProductsFetchStarted()),
        child: Body(
          shopApiClient: shopApiClient,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
