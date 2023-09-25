class RaceCardDetails {
  final String? id;
  final String? date;
  final List<RaceDetails>? data;
  final int? v;

  RaceCardDetails({
    this.id,
    this.date,
    this.data,
    this.v,
  });

  factory RaceCardDetails.fromJson(Map<String, dynamic> json) {
    // Parse the JSON and create a RaceCardDetails object
    return RaceCardDetails(
      id: json['_id'], // Update the key to '_id'
      date: json['date'],
      data: (json['data'] as List<dynamic>)
          .map((item) => RaceDetails.fromJson(item))
          .toList(),
      v: json['__v'], // Update the key to '__v'
    );
  }
}

class RaceDetails {
  final String? tableName; // Change to String?
  final int? horseNumber;
  final int? drawBox;
  final String? horseName;
  final String? aCS;
  final String? trainer;
  final String? jockey;
  final double? weight;
  final int? allowance;
  final int? rating;

  RaceDetails({
    this.tableName,
    this.horseNumber,
    this.drawBox,
    this.horseName,
    this.aCS,
    this.trainer,
    this.jockey,
    this.weight,
    this.allowance,
    this.rating,
  });

  factory RaceDetails.fromJson(Map<String, dynamic> json) {
    return RaceDetails(
      tableName: json['tableName'], // Update the key to 'tableName'
      horseNumber: json['Horse Number'], // Update the key to 'Horse Number'
      drawBox: json['Draw Box'], // Update the key to 'Draw Box'
      horseName: json['Horse Name'], // Update the key to 'Horse Name'
      aCS: json['A/C/S'], // Update the key to 'A/C/S'
      trainer: json['Trainer'],
      jockey: json['Jockey'],
      weight: json['Weight']?.toDouble(), // Update the key to 'Weight'
      allowance: json['Allowance'],
      rating: json['Rating'],
    );
  }

// Rest of your code remains the same...

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

enum TableName { RACE_1, RACE_2, RACE_3, RACE_4, RACE_5 }
