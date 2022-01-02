part of 'products_bloc.dart';

@immutable
abstract class ShopApiEvent {}

class ProductsFetchStarted extends ShopApiEvent {}
class CollectionFetchStarted extends ShopApiEvent {}
