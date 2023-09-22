class RaceCardDetails {
  final String id;
  final String date;
  final List<RaceDetails> data;
  final int v;

  RaceCardDetails({
    required this.id,
    required this.date,
    required this.data,
    required this.v,
  });

  factory RaceCardDetails.fromJson(Map<String, dynamic> json) {
    // Parse the JSON and create a RaceCardDetails object
    return RaceCardDetails(
      id: json['id'],
      date: json['date'],
      data: (json['data'] as List<dynamic>).map((item) => RaceDetails.fromJson(item)).toList(),
      v: json['v'],
    );
  }


}

class RaceDetails {
  final TableName tableName;
  final int horseNumber;
  final int drawBox;
  final String horseName;
  final String aCS;
  final String trainer;
  final String jockey;
  final double weight;
  final int allowance;
  final int rating;

  RaceDetails({
    required this.tableName,
    required this.horseNumber,
    required this.drawBox,
    required this.horseName,
    required this.aCS,
    required this.trainer,
    required this.jockey,
    required this.weight,
    required this.allowance,
    required this.rating,
  });

  factory RaceDetails.fromJson(Map<String, dynamic> json) {
    return RaceDetails(
      tableName: _parseTableName(json['tableName']),
      horseNumber: json['horseNumber'],
      drawBox: json['drawBox'],
      horseName: json['horseName'],
      aCS: json['aCS'],
      trainer: json['trainer'],
      jockey: json['jockey'],
      weight: json['weight'].toDouble(),
      allowance: json['allowance'],
      rating: json['rating'],
    );
  }
  static TableName _parseTableName(String tableName) {
    switch (tableName) {
      case 'RACE_1':
        return TableName.RACE_1;
      case 'RACE_2':
        return TableName.RACE_2;
      case 'RACE_3':
        return TableName.RACE_3;
      case 'RACE_4':
        return TableName.RACE_4;
      case 'RACE_5':
        return TableName.RACE_5;
      default:
        throw ArgumentError('Invalid TableName: $tableName');
    }
  }

}

enum TableName {
  RACE_1,
  RACE_2,
  RACE_3,
  RACE_4,
  RACE_5
}
