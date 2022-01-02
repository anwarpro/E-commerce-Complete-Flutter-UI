part of 'products_bloc.dart';

@immutable
abstract class ShopApiState {}

class ShopApiLoadInProgress extends ShopApiState {}

class ProductsLoadSuccess extends ShopApiState {
  ProductsLoadSuccess(this.products);

  final List<Product> products;
}

class CollectionLoadSuccess extends ShopApiState {
  CollectionLoadSuccess(this.collections);

  final List<Collection> collections;
}

class ShopApiLoadFailure extends ShopApiState {}
