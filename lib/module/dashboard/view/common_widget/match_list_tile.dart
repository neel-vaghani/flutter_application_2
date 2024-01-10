import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/module/dashboard/model/match_model.dart';
import 'package:flutter_application_2/module/dashboard/view/common_widget/common_network_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchListTile extends StatefulWidget {
  const MatchListTile({super.key, this.matchData});
  final Result? matchData;
  @override
  State<MatchListTile> createState() => _MatchListTileState();
}

class _MatchListTileState extends State<MatchListTile> {
  late Timer _timer;
  Rx<Duration?> _duration = Rx(null);

  Duration calculateDuration(DateTime targetTime) {
    return targetTime.difference(DateTime.now());
  }

  void _updateDuration() {
    _duration.value =
        calculateDuration(widget.matchData?.startDate ?? DateTime.now());
  }

  @override
  void initState() {
    _updateDuration();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => _updateDuration());

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        calculateDuration(widget.matchData?.startDate ?? DateTime.now());
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 10,
                  offset: const Offset(0, 10))
            ]),
        child: Column(
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.notification_add,
                    size: 14,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      widget.matchData?.name ?? '',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.save,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          CommonNetworkImage(
                            url: widget.matchData?.team1Logo ?? '',
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.matchData?.team1Display ?? '',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.matchData?.team1Name ?? '',
                          style: const TextStyle(
                            fontSize: 9,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Text(
                    '${_duration.value?.inHours}:${(_duration.value!.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.value!.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.matchData?.team2Display ?? '',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          CommonNetworkImage(
                            url: widget.matchData?.team2Logo ?? '',
                          ),
                          const SizedBox(width: 10)
                        ],
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          widget.matchData?.team2Name ?? '',
                          style: const TextStyle(
                            fontSize: 9,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 1.5),
                          child: Text(
                            "MEGA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        )),
                    const SizedBox(width: 6),
                    Text(
                      widget.matchData?.amount ?? '',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
