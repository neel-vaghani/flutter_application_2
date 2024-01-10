// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/module/auth/view/screen/login_screen.dart';
import 'package:flutter_application_2/module/dashboard/controller/match_controller.dart';
import 'package:flutter_application_2/module/dashboard/model/match_model.dart';
import 'package:flutter_application_2/module/dashboard/view/common_widget/common_network_image.dart';
import 'package:flutter_application_2/module/dashboard/view/common_widget/match_list_tile.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  void initState() {
    dashboardController.getDashboardData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(
        () => dashboardController.isFetchingDashboardData.value
            ? const Center(child: CupertinoActivityIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(14),
                itemCount:
                    dashboardController.dashboardData.value?.result?.length ??
                        0,
                itemBuilder: (context, index) {
                  print("Buidld id $index");
                  return MatchListTile(
                    matchData:
                        dashboardController.dashboardData.value?.result?[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
      ),
    );
  }
}
