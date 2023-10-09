

class TodayTournamentDetails {
  final String? id;
  final String? tournamentName;
  final String? date;
  final int? entryFee;
  final int? prizeMoney;
  final int? startingPoint;
  final String? pricePool;
  final String? payoutStructure;
  final int? minPlayers;
  final int? maxPlayers;
  final String? announceDate;
  final String? announceTime;
  final String? startDate;
  final String? startTime;
  final String? registrationDate;
  final String? registrationTime;
  final List<List<String>>? races;
  final int? v;

  TodayTournamentDetails({
     this.tournamentName,
     this.date,
     this.entryFee,
     this.prizeMoney,
     this.startingPoint,
     this.pricePool,
     this.payoutStructure,
     this.minPlayers,
     this.maxPlayers,
     this.announceDate,
     this.announceTime,
     this.startDate,
     this.startTime,
     this.registrationDate,
     this.registrationTime,
     this.races,
     this.id,
     this.v,
  });

  factory TodayTournamentDetails.fromJson(Map<String, dynamic> json) {
    return TodayTournamentDetails(
      id: json['_id'],
      tournamentName: json['tournamentName'],
      date: json['date'],
      entryFee: json['entryFee'],
      prizeMoney: json['prizeMoney'],
      startingPoint: json['startingPoint'],
      pricePool: json['pricePool'],
      payoutStructure: json['payoutStructure'],
      minPlayers: json['minPlayers'],
      maxPlayers: json['maxPlayers'],
      announceDate: json['announceDate'],
      announceTime: json['announceTime'],
      startDate: json['startDate'],
      startTime: json['startTime'],
      registrationDate: json['registrationDate'],
      registrationTime: json['registrationTime'],
      races: List<List<String>>.from((json['races'] as List<dynamic>).map((x) => List<String>.from(x.map((x) => x.toString())))),
      v: json['__v'],
    );
  }
}

class Race {
  final TableName? tableName;
  final int? horseNumber;
  final int? drawBox;
  final String? horseName;
  final String? aCS;
  final String? trainer;
  final String? jockey;
  final double? weight;
  final int? allowance;
  final int? rating;

  Race({
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
}

enum TableName {
  RACE_1,
  RACE_2
}
