import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/module/dashboard/model/match_model.dart';
import 'package:flutter_application_2/module/dashboard/service/dashboard_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // SCREEN DATA
  Rx<MatchModel?> dashboardData = Rx(null);

  // LOADER .
  RxBool isFetchingDashboardData = false.obs;

  // GET DATA
  Future<void> getDashboardData({required BuildContext context}) async {
    isFetchingDashboardData.value = true;

    Either<MatchModel?, String> failOrSuccess =
        await DashboardService.getMatchData();

    // SUCCESS PART
    failOrSuccess.fold(
      (success) {
        dashboardData.value = success;
        // ERROR PART
      },
      (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
          ),
        );
      },
    );
    isFetchingDashboardData.value = false;
  }
}
