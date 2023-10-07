import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/providers/data_repository_provider.dart';

// The providers in this file serve for mainly providing the Async fetch methods linked to the service/repo layers managed by ProviderScope

// Use FutureProvider when working with async operations
final countriesDataProvider = FutureProvider<List<CountryModel>>((ref) async {
  return ref.watch(dataRepositoryProvider).getCountries();
});
//Use the family provider modifier when you want your provider to depend on external parameters, like 'code' in this case
final getCountryByCodeDataProvider =
    FutureProvider.family<CountryModel?, String>((ref, code) async {
  return ref.watch(dataRepositoryProvider).getCountryByCode(code);
});
