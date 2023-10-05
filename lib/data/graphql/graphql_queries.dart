import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_fragments.dart';

class GraphQLQueries {
  static final getAllCountries = gql('''
    query getAllCountries{
      countries {
      ${CountryFields.shortDisplayCountryFields}
      }
    }
  
''');
  static getCountryByCode(String countryCode) => gql('''
  query getCountryByCode{
    country(code : "$countryCode") {
      ${CountryFields.fullFieldsCountryFields}
    }
  }
''');
  static getCountryByCodeProperSyntax() => gql(r'''
  query GetCountryByCode($code: ID!){
    country(code:$code){
    name
   }
  }
''');
}
