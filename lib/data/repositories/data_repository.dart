import 'package:flutter/material.dart';
import 'package:safenow_demo/data/services/data_service.dart';
import 'package:safenow_demo/models/country_model.dart';

// abstract 'interface' class
abstract class DataRepository {
  Future<List<CountryModel>> getCountries();
  Future<CountryModel?> getCountryByCode(String code);
}

// Repository 'concrete' Implementation class
class DataRepositoryImpl implements DataRepository {
  final DataService _dataService;
  DataRepositoryImpl(this._dataService);

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await _dataService.getCountries();

    return response.fold(
      (error) => [],
      (data) {
        debugPrint(
            "'getCountries graphQL query returned some data.. now parsing");
        final countries = _parseCountriesData(data);
        debugPrint("successfully parsed list of countries");
        return countries;
      },
    );
  }

  @override
  Future<CountryModel?> getCountryByCode(String code) async {
    final response = await _dataService.getCountryByCode(code);

    return response.fold(
      (error) => null,
      (data) {
        debugPrint(
            "'getCountryByCode graphQL query returned some data.. now parsing");
        final country = _parseCountryData(data);
        return country ?? country;
      },
    );
  }

  CountryModel? _parseCountryData(Map<String, dynamic> data) {
    // Extract the countries List from the Map
    try {
      Map<String, dynamic> countryData = data['country'];
      final country = CountryModel.fromJson(countryData);
      print("country: ${country.name}");
      return country;
    } catch (e) {
      print("Error while parsing data: $e");
      return null;
    }
  }

  List<CountryModel> _parseCountriesData(Map<String, dynamic> data) {
    // Extract the countries List from the Map
    List<Map<String, dynamic>> countriesData =
        data['countries'].cast<Map<String, dynamic>>();

    // Map and extract each country's fields into CountryModel objects
    final List<CountryModel> countries = countriesData
        .map((countryData) => CountryModel.fromJson(countryData))
        .toList();

    return countries;
  }
}
