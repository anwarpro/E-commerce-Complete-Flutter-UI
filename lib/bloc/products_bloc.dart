import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/api/api.dart';

part 'products_event.dart';

part 'products_state.dart';

class ShopApiBloc extends Bloc<ShopApiEvent, ShopApiState> {
  ShopApiBloc({required ShopApiClient productsApiClient})
      : _productsApiClient = productsApiClient,
        super(ShopApiLoadInProgress()) {
    on<ProductsFetchStarted>(_onProductsFetchStarted);
    on<CollectionFetchStarted>(_onCollectionsFetchStarted);
  }

  final ShopApiClient _productsApiClient;

  void _onProductsFetchStarted(
    ProductsFetchStarted event,
    Emitter<ShopApiState> emit,
  ) async {
    emit(ShopApiLoadInProgress());
    try {
      final results = await _productsApiClient.getProducts();
      emit(ProductsLoadSuccess(results));
    } catch (_) {
      emit(ShopApiLoadFailure());
    }
  }

  void _onCollectionsFetchStarted(
    CollectionFetchStarted event,
    Emitter<ShopApiState> emit,
  ) async {
    emit(ShopApiLoadInProgress());
    try {
      final results = await _productsApiClient.getCollections();
      emit(CollectionLoadSuccess(results));
    } catch (_) {
      emit(ShopApiLoadFailure());
    }
  }
}
