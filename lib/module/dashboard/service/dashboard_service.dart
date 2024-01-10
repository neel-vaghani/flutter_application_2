// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api_service/app_dio.dart';
import 'package:flutter_application_2/module/dashboard/model/match_model.dart';

abstract class DashboardService {
  // GET MATCH DATA DATA
  static Future<Either<MatchModel?, String>> getMatchData() async {
    try {
      final res = await APIDio.instance.get(
        'auth/getmatchlist',
      );
      final response = matchModelFromJson(jsonEncode(res.data));
      log(name: "Match Data", jsonEncode(res.data));
      return Left(response);
    } on DioError catch (e) {
      return right(e.type.name);
    }
  }
}
