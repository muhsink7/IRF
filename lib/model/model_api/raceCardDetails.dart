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

}

enum TableName {
  RACE_1,
  RACE_2,
  RACE_3,
  RACE_4,
  RACE_5
}
