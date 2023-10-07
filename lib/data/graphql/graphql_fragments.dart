// Dart class for preparing the GraphQL query fields, or fragments
class CountryFields {
  static const String fullFieldsCountryFields = '''
      code
      name
      emoji
      awsRegion
      capital
      continent {
        code
        name
      }
      currency
      languages {
        code
        name
      }
      native
      phone

  ''';
  static const String shortDisplayCountryFragment = '''
    fragment CountryFields on Country {
      name
      code 
      emoji
    }
  ''';

  static const shortDisplayCountryFields = r'''
      name
      code
      emoji
  ''';
}
