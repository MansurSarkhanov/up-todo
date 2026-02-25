import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_appbar.dart';

class FocusView extends StatefulWidget {
  const FocusView({super.key});

  @override
  State<FocusView> createState() => _FocusViewState();
}

class _FocusViewState extends State<FocusView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  int _seconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 25),
    );
  }

  void _startFocus() {
    if (_isRunning) return;

    setState(() => _isRunning = true);

    _controller.forward(from: 0);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });
  }

  void _stopFocus() {
    _controller.stop();
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  String get formattedTime {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.verticalSpace,
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 220,
                  width: 220,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (_, _) {
                      return CircularProgressIndicator(
                        value: _controller.value,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey.shade800,
                        valueColor: const AlwaysStoppedAnimation(
                          Colors.purpleAccent,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  formattedTime,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            30.verticalSpace,
            Center(
              child: Text(
                "While your focus mode is on, all of your notifications will be off",
                textAlign: TextAlign.center,
                style: context.typography.body2Regular,
              ),
            ),
            20.verticalSpace,
            Center(child: CustomButton(text: 'Start Focus')),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Overview", style: context.typography.body1Regular),
                Text("This Week", style: context.typography.body2Regular),
              ],
            ),
            20.verticalSpace,
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  backgroundColor: Colors.transparent,
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  barGroups: [
                    _bar(3),
                    _bar(4),
                    _bar(5),
                    _bar(3),
                    _bar(4.5),
                    _bar(4),
                    _bar(2),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Applications",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 20),

            _appTile("Instagram", "1h spent today"),
            _appTile("Twitter", "3h spent today"),
            _appTile("Facebook", "2h spent today"),
            _appTile("Telegram", "30m spent today"),
            _appTile("Gmail", "45m spent today"),
            80.verticalSpace,
          ],
        ),
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: SizedBox.shrink(),
      title: Text('Focus', style: context.typography.h5Medium),
    );
  }

  BarChartGroupData _bar(double value) {
    return BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 18,
          borderRadius: BorderRadius.circular(4),
          color: context.colors.primary,
        ),
      ],
    );
  }

  Widget _appTile(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C22),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colors.primary,
            child: Icon(Icons.apps, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.info_outline, color: Colors.grey),
        ],
      ),
    );
  }
}
