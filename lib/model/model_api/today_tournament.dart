
class TodayTournamentDetails {
  final String tournamentName;
  final String date;
  final int entryFee;
  final int prizeMoney;
  final int startingPoint;
  final String pricePool;
  final String payoutStructure;
  final int minPlayers;
  final int maxPlayers;
  final String announceDate;
  final String announceTime;
  final String startDate;
  final String startTime;
  final String registrationDate;
  final String registrationTime;
  final List<List<Race>> races;

  TodayTournamentDetails({
    required this.tournamentName,
    required this.date,
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
  });
  factory TodayTournamentDetails.fromJson(Map<String, dynamic> json) {
    return TodayTournamentDetails(
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
      races: (json['races'] as List).map((raceList) {
        return (raceList as List)
            .map((raceData) => Race.fromJson(raceData))
            .toList();
      }).toList(),
    );
  }

}

class Race {
  final String tableName;
  final List<Detail> details;

  Race({
    required this.tableName,
    required this.details,
  });
  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      tableName: json['tableName'],
      details: (json['details'] as List)
          .map((detailData) => Detail.fromJson(detailData))
          .toList(),
    );
  }

}

class Detail {
  final int? horseNumber;
  final int? drawBox;
  final String? horseName;
  final String? aCS;
  final String? trainer;
  final String? jockey;
  final double? weight;
  final int? allowance;
  final int? rating;

  Detail({
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

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
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

}


// class TodayTournamentDetails {
//   final String id;
//   final String tournamentName;
//   final String date;
//   final int entryFee;
//   final int prizeMoney;
//   final int startingPoint;
//   final String pricePool;
//   final String payoutStructure;
//   final int minPlayers;
//   final int maxPlayers;
//   final String announceDate;
//   final String announceTime;
//   final String startDate;
//   final String startTime;
//   final String registrationDate;
//   final String registrationTime;
//   final List<List<dynamic>> races;
//   final int v;
//
//   TodayTournamentDetails({
//     required this.id,
//     required this.tournamentName,
//     required this.date,
//     required this.entryFee,
//     required this.prizeMoney,
//     required this.startingPoint,
//     required this.pricePool,
//     required this.payoutStructure,
//     required this.minPlayers,
//     required this.maxPlayers,
//     required this.announceDate,
//     required this.announceTime,
//     required this.startDate,
//     required this.startTime,
//     required this.registrationDate,
//     required this.registrationTime,
//     required this.races,
//     required this.v,
//   });
//
//
//
//
// }
//
// class RaceClass {
//   final String tableName;
//   final int horseNumber;
//   final int drawBox;
//   final String horseName;
//   final String aCS;
//   final String trainer;
//   final String jockey;
//   final double weight;
//   final int allowance;
//   final int rating;
//   final List<Detail> details;
//
//   RaceClass({
//     required this.tableName,
//     required this.horseNumber,
//     required this.drawBox,
//     required this.horseName,
//     required this.aCS,
//     required this.trainer,
//     required this.jockey,
//     required this.weight,
//     required this.allowance,
//     required this.rating,
//     required this.details,
//   });
//
//
//
//
// }
//
// class Detail {
//   final int? horseNumber;
//   final int? drawBox;
//   final String? horseName;
//   final String? aCS;
//   final String? trainer;
//   final String? jockey;
//   final double? weight;
//   final int? allowance;
//   final int? rating;
//
//   Detail({
//      this.horseNumber,
//      this.drawBox,
//      this.horseName,
//      this.aCS,
//      this.trainer,
//      this.jockey,
//      this.weight,
//      this.allowance,
//      this.rating,
//   });
//
//   factory Detail.fromJson(Map<String, dynamic> json) {
//     return Detail(
//       horseNumber: json['horseNumber'],
//       drawBox: json['drawBox'],
//       horseName: json['horseName'],
//       aCS: json['aCS'],
//       trainer: json['trainer'],
//       jockey: json['jockey'],
//       weight: json['weight'].toDouble(),
//       allowance: json['allowance'],
//       rating: json['rating'],
//     );
//   }
//
//
// }
//
// enum RaceEnum {
//   RACE_1,
//   RACE_2,
//   RACE_3,
//   RACE_4,
//   RACE_5
// }




// class TodayTournamentDetails {
//   final String? id;
//   final String? tournamentName;
//   final String? date;
//   final int? entryFee;
//   final int? prizeMoney;
//   final int? startingPoint;
//   final String? pricePool;
//   final String? payoutStructure;
//   final int? minPlayers;
//   final int? maxPlayers;
//   final String? announceDate;
//   final String? announceTime;
//   final String? startDate;
//   final String? startTime;
//   final String? registrationDate;
//   final String? registrationTime;
//   final List<List<String>>? races;
//   final int? v;
//
//   TodayTournamentDetails({
//      this.tournamentName,
//      this.date,
//      this.entryFee,
//      this.prizeMoney,
//      this.startingPoint,
//      this.pricePool,
//      this.payoutStructure,
//      this.minPlayers,
//      this.maxPlayers,
//      this.announceDate,
//      this.announceTime,
//      this.startDate,
//      this.startTime,
//      this.registrationDate,
//      this.registrationTime,
//      this.races,
//      this.id,
//      this.v,
//   });
//
//   factory TodayTournamentDetails.fromJson(Map<String, dynamic> json) {
//     return TodayTournamentDetails(
//       id: json['_id'],
//       tournamentName: json['tournamentName'],
//       date: json['date'],
//       entryFee: json['entryFee'],
//       prizeMoney: json['prizeMoney'],
//       startingPoint: json['startingPoint'],
//       pricePool: json['pricePool'],
//       payoutStructure: json['payoutStructure'],
//       minPlayers: json['minPlayers'],
//       maxPlayers: json['maxPlayers'],
//       announceDate: json['announceDate'],
//       announceTime: json['announceTime'],
//       startDate: json['startDate'],
//       startTime: json['startTime'],
//       registrationDate: json['registrationDate'],
//       registrationTime: json['registrationTime'],
//       races: List<List<String>>.from((json['races'] as List<dynamic>).map((x) => List<String>.from(x.map((x) => x.toString())))),
//       v: json['__v'],
//     );
//   }
// }
//
// class Race {
//   final String? tableName;
//   final int? horseNumber;
//   final int? drawBox;
//   final String? horseName;
//   final String? aCS;
//   final String? trainer;
//   final String? jockey;
//   final double? weight;
//   final int? allowance;
//   final int? rating;
//
//   Race({
//      this.tableName,
//      this.horseNumber,
//      this.drawBox,
//      this.horseName,
//      this.aCS,
//      this.trainer,
//      this.jockey,
//      this.weight,
//      this.allowance,
//      this.rating,
//   });
// }
//
