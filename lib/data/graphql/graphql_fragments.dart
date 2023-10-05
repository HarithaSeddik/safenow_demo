class CountryFields {
  static const String fullFieldsCountryFields = '''
    fragment CountryFields on Country {
      awsRegion
      capital
      code
      continent {
        code
        name
      }
      currency
      emoji
      languages {
        code
        name
      }
      name
      native
      phone
    }
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
