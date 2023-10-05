import 'package:safenow_demo/data/repositories/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/providers/data_service_provider.dart';

// Entry point for the shared data
/// Provider that maps an [DataRepository] interface to implementation
final dataRepositoryProvider = Provider<DataRepository>((ref) {
  final graphQLService = ref.read(serviceProvider);
  //Also known as decorator pattern, only exposing the abstract class to the public
  return DataRepositoryImpl(graphQLService);
});
