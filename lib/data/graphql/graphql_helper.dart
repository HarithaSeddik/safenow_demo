import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String graphQLEndpoint = 'https://countries.trevorblades.com/';

class GraphQLHelper {
  static late ValueNotifier<GraphQLClient> clientNotifier;
  static late GraphQLClient client;
  static void init() {
    client = GraphQLClient(
      link: HttpLink(graphQLEndpoint),
      cache: GraphQLCache(),
    );
    clientNotifier = ValueNotifier(client);
  }
}
