import 'package:graphql/client.dart';
import 'package:shop_app/api/models/models.dart';
import 'package:shop_app/api/queries/queries.dart' as queries;

class GetShopRequestFailure implements Exception {}

class ShopApiClient {
  const ShopApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory ShopApiClient.create() {
    final httpLink = HttpLink('https://vendure.helloanwar.com/shop-api');
    final link = Link.from([httpLink]);
    return ShopApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<Product>> getProducts() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getProducts)),
    );

    if (result.hasException) throw GetShopRequestFailure();

    final data = result.data?['products']['items'] as List;
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Collection>> getCollections() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getCollections)),
    );

    if (result.hasException) throw GetShopRequestFailure();

    final data = result.data?['collections']['items'] as List;
    return data.map((e) => Collection.fromJson(e)).toList();
  }
}
