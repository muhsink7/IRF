class TournamentDetails {
  final String? message;
  final Tournament? tournament;

  TournamentDetails({
    required this.message,
    required this.tournament,
  });

  factory TournamentDetails.fromJson(Map<String, dynamic> json) {
    return TournamentDetails(
      message: json['message'],
      tournament: Tournament.fromJson(json['tournament']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'tournament': tournament?.toJson(),
    };
  }
}

class Tournament {
  final String? tournamentName;
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
  final List<List<String?>> races;
  final String? id;
  final int? v;

  Tournament({
    required this.tournamentName,
    required this.entryFee,
    required this.prizeMoney,
    required this.startingPoint,
    required this.pricePool,
    required this.payoutStructure,
    required this.minPlayers,
    required this.maxPlayers,
    required this.announceDate,
    required this.announceTime,
    required this.startDate,
    required this.startTime,
    required this.registrationDate,
    required this.registrationTime,
    required this.races,
    required this.id,
    required this.v,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      tournamentName: json['tournamentName'],
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
      races: (json['races'] as List).map<List<String?>>((race) => List<String?>.from(race)).toList(),
      id: json['id'],
      v: json['v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tournamentName': tournamentName,
      'entryFee': entryFee,
      'prizeMoney': prizeMoney,
      'startingPoint': startingPoint,
      'pricePool': pricePool,
      'payoutStructure': payoutStructure,
      'minPlayers': minPlayers,
      'maxPlayers': maxPlayers,
      'announceDate': announceDate,
      'announceTime': announceTime,
      'startDate': startDate,
      'startTime': startTime,
      'registrationDate': registrationDate,
      'registrationTime': registrationTime,
      'races': races,
      'id': id,
      'v': v,
    };
  }
}
