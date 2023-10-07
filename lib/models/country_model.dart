//Dart model class to make UI-ready Dart objects from JSON data
class CountryModel {
  final String? awsRegion;
  final String? capital;
  final String code;
  final Continent? continent;
  final String? currency;
  final String emoji;
  final List<Language>? languages;
  final String name;
  final String? native;
  final String? phone;

  CountryModel({
    required this.code,
    required this.name,
    required this.emoji,
    this.awsRegion,
    this.capital,
    this.continent,
    this.currency,
    this.languages,
    this.native,
    this.phone,
  });
  //Factory constructor design works well with handling data from/to JSON format
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      awsRegion: json['awsRegion'],
      capital: json['capital'],
      code: json['code'],
      continent: json['continent'] != null
          ? Continent.fromJson(json['continent'])
          : null,
      currency: json['currency'],
      emoji: json['emoji'],
      languages: json['languages'] != null
          ? List<Language>.from(
              json['languages'].map((x) => Language.fromJson(x)))
          : null,
      name: json['name'],
      native: json['native'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'awsRegion': awsRegion,
      'capital': capital,
      'code': code,
      'continent': continent?.toJson(),
      'currency': currency,
      'emoji': emoji,
      'languages': languages?.map((x) => x.toJson()).toList(),
      'name': name,
      'native': native,
      'phone': phone,
    };
  }
}

class Continent {
  final String? code;
  final String? name;

  Continent({
    this.code,
    this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }
}

class Language {
  final String? code;
  final String? name;

  Language({
    this.code,
    this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }
}
