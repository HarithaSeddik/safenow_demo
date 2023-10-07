import 'package:safenow_demo/data/graphql/graphql_helper.dart';
import 'package:safenow_demo/data/services/data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Entry point for the shared data
/// Provider that maps an [DataService] interface to implementation
final serviceProvider = Provider<DataService>((ref) {
  //Also known as the decorator pattern, hiding the implementation class from the
  //public while exposing the abstract interface class
  return GraphQLDataService(GraphQLHelper.client);
});
