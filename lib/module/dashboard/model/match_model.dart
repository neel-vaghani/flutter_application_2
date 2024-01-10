// To parse this JSON data, do
//
//     final matchModel = matchModelFromJson(jsonString);

import 'dart:convert';

MatchModel matchModelFromJson(String str) =>
    MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  int? status;
  List<Result>? result;
  List<dynamic>? usersMatches;

  MatchModel({
    this.status,
    this.result,
    this.usersMatches,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        usersMatches: json["users_matches"] == null
            ? []
            : List<dynamic>.from(json["users_matches"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "users_matches": usersMatches == null
            ? []
            : List<dynamic>.from(usersMatches!.map((x) => x)),
      };
}

class Result {
  int? id;
  String? name;
  DateTime? timeDiff;
  String? shortName;
  String? format;
  int? series;
  String? seriesname;
  String? toss;
  String? team1Display;
  String? team2Display;
  String? team1Name;
  String? team2Name;
  String? matchkey;
  String? winnerstatus;
  String? launchStatus;
  int? matchStatusKey;
  String? matchStatus;
  String? sportKey;
  int? joinedCount;
  int? teamCount;
  String? winningTotal;
  String? finalStatus;
  String? url;
  String? bannerImage;
  String? team1Logo;
  String? team2Logo;
  int? lineup;
  String? matchopenstatus;
  String? matchindexing;
  DateTime? startDate;
  DateTime? timeStart;
  Locktime? locktime;
  String? highlights;
  int? isHighlights;
  int? isMatchHighlight;
  String? team1PlayerImage;
  String? team2PlayerImage;
  String? isMatchHighlightsImage;
  int? isLeaderboard;
  String? team1Color;
  String? team2Color;
  int? isAmountShow;
  String? amount;
  int? livefantasy;
  int? battingfantasy;
  int? bowlingfantasy;
  int? reversefantasy;
  int? tenonefantasy;
  int? fullMatch;
  int? isScoreCardVisible;
  int? isCommentartVisible;
  int? secondinning;
  List<dynamic>? slotes;
  int? isGiveawayVisible;
  String? giveawayAmount;
  int? isVisibleTotalEarned;
  String? totalEarned;
  String? totalTdsDeductions;
  String? isVisibleTds;
  int? isFixture;
  int? isNotificationSubscribed;
  int? isPinned;
  String? sportsname;

  Result({
    this.id,
    this.name,
    this.timeDiff,
    this.shortName,
    this.format,
    this.series,
    this.seriesname,
    this.toss,
    this.team1Display,
    this.team2Display,
    this.team1Name,
    this.team2Name,
    this.matchkey,
    this.winnerstatus,
    this.launchStatus,
    this.matchStatusKey,
    this.matchStatus,
    this.sportKey,
    this.joinedCount,
    this.teamCount,
    this.winningTotal,
    this.finalStatus,
    this.url,
    this.bannerImage,
    this.team1Logo,
    this.team2Logo,
    this.lineup,
    this.matchopenstatus,
    this.matchindexing,
    this.startDate,
    this.timeStart,
    this.locktime,
    this.highlights,
    this.isHighlights,
    this.isMatchHighlight,
    this.team1PlayerImage,
    this.team2PlayerImage,
    this.isMatchHighlightsImage,
    this.isLeaderboard,
    this.team1Color,
    this.team2Color,
    this.isAmountShow,
    this.amount,
    this.livefantasy,
    this.battingfantasy,
    this.bowlingfantasy,
    this.reversefantasy,
    this.tenonefantasy,
    this.fullMatch,
    this.isScoreCardVisible,
    this.isCommentartVisible,
    this.secondinning,
    this.slotes,
    this.isGiveawayVisible,
    this.giveawayAmount,
    this.isVisibleTotalEarned,
    this.totalEarned,
    this.totalTdsDeductions,
    this.isVisibleTds,
    this.isFixture,
    this.isNotificationSubscribed,
    this.isPinned,
    this.sportsname,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        timeDiff: json["time_diff"] == null
            ? null
            : DateTime.parse(json["time_diff"]),
        shortName: json["short_name"],
        format: json["format"],
        series: json["series"],
        seriesname: json["seriesname"],
        toss: json["toss"],
        team1Display: json["team1display"],
        team2Display: json["team2display"],
        team1Name: json["team1name"],
        team2Name: json["team2name"],
        matchkey: json["matchkey"],
        winnerstatus: json["winnerstatus"],
        launchStatus: json["launch_status"],
        matchStatusKey: json["match_status_key"],
        matchStatus: json["match_status"],
        sportKey: json["sport_key"],
        joinedCount: json["joined_count"],
        teamCount: json["team_count"],
        winningTotal: json["winning_total"],
        finalStatus: json["final_status"],
        url: json["url"],
        bannerImage: json["banner_image"],
        team1Logo: json["team1logo"],
        team2Logo: json["team2logo"],
        lineup: json["lineup"],
        matchopenstatus: json["matchopenstatus"],
        matchindexing: json["matchindexing"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        timeStart: json["time_start"] == null
            ? null
            : DateTime.parse(json["time_start"]),
        locktime: json["locktime"] == null
            ? null
            : Locktime.fromJson(json["locktime"]),
        highlights: json["highlights"],
        isHighlights: json["is_highlights"],
        isMatchHighlight: json["is_match_highlight"],
        team1PlayerImage: json["team1player_image"],
        team2PlayerImage: json["team2player_image"],
        isMatchHighlightsImage: json["is_match_highlights_image"],
        isLeaderboard: json["is_leaderboard"],
        team1Color: json["team1_color"],
        team2Color: json["team2_color"],
        isAmountShow: json["is_amount_show"],
        amount: json["amount"],
        livefantasy: json["livefantasy"],
        battingfantasy: json["battingfantasy"],
        bowlingfantasy: json["bowlingfantasy"],
        reversefantasy: json["reversefantasy"],
        tenonefantasy: json["tenonefantasy"],
        fullMatch: json["full_match"],
        isScoreCardVisible: json["isScoreCardVisible"],
        isCommentartVisible: json["isCommentartVisible"],
        secondinning: json["secondinning"],
        slotes: json["slotes"] == null
            ? []
            : List<dynamic>.from(json["slotes"]!.map((x) => x)),
        isGiveawayVisible: json["is_giveaway_visible"],
        giveawayAmount: json["giveaway_amount"],
        isVisibleTotalEarned: json["is_visible_total_earned"],
        totalEarned: json["total_earned"],
        totalTdsDeductions: json["total_tds_deductions"],
        isVisibleTds: json["is_visible_tds"],
        isFixture: json["is_fixture"],
        isNotificationSubscribed: json["is_notification_subscribed"],
        isPinned: json["is_pinned"],
        sportsname: json["Sportsname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "time_diff": timeDiff?.toIso8601String(),
        "short_name": shortName,
        "format": format,
        "series": series,
        "seriesname": seriesname,
        "toss": toss,
        "team1display": team1Display,
        "team2display": team2Display,
        "team1name": team1Name,
        "team2name": team2Name,
        "matchkey": matchkey,
        "winnerstatus": winnerstatus,
        "launch_status": launchStatus,
        "match_status_key": matchStatusKey,
        "match_status": matchStatus,
        "sport_key": sportKey,
        "joined_count": joinedCount,
        "team_count": teamCount,
        "winning_total": winningTotal,
        "final_status": finalStatus,
        "url": url,
        "banner_image": bannerImage,
        "team1logo": team1Logo,
        "team2logo": team2Logo,
        "lineup": lineup,
        "matchopenstatus": matchopenstatus,
        "matchindexing": matchindexing,
        "start_date": startDate?.toIso8601String(),
        "time_start": timeStart?.toIso8601String(),
        "locktime": locktime?.toJson(),
        "highlights": highlights,
        "is_highlights": isHighlights,
        "is_match_highlight": isMatchHighlight,
        "team1player_image": team1PlayerImage,
        "team2player_image": team2PlayerImage,
        "is_match_highlights_image": isMatchHighlightsImage,
        "is_leaderboard": isLeaderboard,
        "team1_color": team1Color,
        "team2_color": team2Color,
        "is_amount_show": isAmountShow,
        "amount": amount,
        "livefantasy": livefantasy,
        "battingfantasy": battingfantasy,
        "bowlingfantasy": bowlingfantasy,
        "reversefantasy": reversefantasy,
        "tenonefantasy": tenonefantasy,
        "full_match": fullMatch,
        "isScoreCardVisible": isScoreCardVisible,
        "isCommentartVisible": isCommentartVisible,
        "secondinning": secondinning,
        "slotes":
            slotes == null ? [] : List<dynamic>.from(slotes!.map((x) => x)),
        "is_giveaway_visible": isGiveawayVisible,
        "giveaway_amount": giveawayAmount,
        "is_visible_total_earned": isVisibleTotalEarned,
        "total_earned": totalEarned,
        "total_tds_deductions": totalTdsDeductions,
        "is_visible_tds": isVisibleTds,
        "is_fixture": isFixture,
        "is_notification_subscribed": isNotificationSubscribed,
        "is_pinned": isPinned,
        "Sportsname": sportsname,
      };
}

class Locktime {
  DateTime? date;
  int? timezoneType;
  String? timezone;

  Locktime({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory Locktime.fromJson(Map<String, dynamic> json) => Locktime(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
