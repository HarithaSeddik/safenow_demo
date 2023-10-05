import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:safenow_demo/data/graphql/graphql_queries.dart';

// Interface Service Layer
abstract class DataService {
  Future<Either<Error, dynamic>> getCountries();
  Future<Either<Error, dynamic>> getCountryByCode(String code);
}

// GraphQL 'concrete' Implementation of the Service
class GraphQLDataService implements DataService {
  final GraphQLClient _client;

  GraphQLDataService(this._client);

  @override
  Future<Either<Error, Map<String, dynamic>?>> getCountries() async {
    debugPrint("now running GraphQL query to get all countries");
    final response = await _client.query(
      QueryOptions(
        document: GraphQLQueries.getAllCountries,
      ),
    );
    if (response.hasException) {
      print(
          "Error while calling getCountries GraphQL query: ${response.exception.toString()}");
      return Left(Error());
    }
    return Right(response.data);
  }

  @override
  Future<Either<Error, Map<String, dynamic>?>> getCountryByCode(
      String code) async {
    final response = await _client.query(QueryOptions(
      document: gql(
        GraphQLQueries.getCountryByCode(code),
      ),
    ));
    if (response.hasException) {
      print(
          "Error while calling getCountryByCode GraphQL query: ${response.exception.toString()}");
      return Left(Error());
    }
    return Right(response.data);
  }
}
