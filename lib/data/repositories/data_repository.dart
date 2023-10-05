import 'package:flutter/material.dart';
import 'package:safenow_demo/data/services/data_service.dart';
import 'package:safenow_demo/models/country_model.dart';

// abstract 'interface' class
abstract class DataRepository {
  Future<List<CountryModel>> getCountries();
  Future<CountryModel?> getCountryByCode(String code);
  CountryModel parseCountryData(Map<String, dynamic> data);
}

// Repository Implementation
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
        debugPrint(
            "successfully parsed list of countries: ${countries.map((e) => e.name).join(" , ")}");
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
        final country = parseCountryData(data);
        debugPrint("successfully parsed country: ${country.name}");
        return country;
      },
    );
  }

  @override
  CountryModel parseCountryData(Map<String, dynamic> data) {
    // Extract the countries List from the Map
    Map<String, dynamic> countryData =
        data['country'].cast<Map<String, dynamic>>();
    final country = CountryModel.fromJson(countryData);
    return country;
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
