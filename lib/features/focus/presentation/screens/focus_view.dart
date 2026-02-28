import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc importu
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_appbar.dart';
import '../bloc/focus_bloc.dart'; // Kendi path'ine göre düzenle
import '../bloc/focus_event.dart';
import '../bloc/focus_state.dart';

class FocusView extends StatelessWidget {
  const FocusView({super.key});

  // Saniyeyi MM:SS formatına çeviren yardımcı fonksiyon
  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colors.backgroundColor,
      body: BlocConsumer<FocusBloc, FocusState>(
        listener: (context, state) {
          if (state is FocusCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Focus session saved successfully!"),
              ),
            );
          } else if (state is FocusError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                      child: CircularProgressIndicator(
                        value: state.totalTargetSeconds > 0
                            ? state.remainingSeconds / state.totalTargetSeconds
                            : 0,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey.shade800,
                        valueColor: AlwaysStoppedAnimation(
                          context.colors.primary,
                        ),
                      ),
                    ),
                    Text(
                      _formatTime(state.remainingSeconds),
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
                    state is FocusRunning
                        ? "Stay focused! Notifications are muted."
                        : "While your focus mode is on, all of your notifications will be off",
                    textAlign: TextAlign.center,
                    style: context.typography.body2Regular,
                  ),
                ),
                20.verticalSpace,
                Center(
                  child: CustomButton(
                    onTap: () {
                      if (state is FocusInitial || state is FocusCompleted) {
                        final userId = context.read<AuthBloc>().state.user!.uid;
                        context.read<FocusBloc>().add(
                          StartFocusEvent(
                            durationSeconds: 1500,
                            userId: userId,
                          ),
                        );
                      } else if (state is FocusRunning) {
                        context.read<FocusBloc>().add(PauseFocusEvent());
                      } else if (state is FocusPaused) {
                        context.read<FocusBloc>().add(ResumeFocusEvent());
                      }
                    },
                    text: _getButtonText(state),
                  ),
                ),
                if (state is FocusRunning || state is FocusPaused)
                  TextButton(
                    onPressed: () {
                      final userId = context.read<AuthBloc>().state.user!.uid;
                      context.read<FocusBloc>().add(
                        StopAndSaveFocusEvent(userId: userId),
                      );
                    },
                    child: const Text(
                      "Stop and Save",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),

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
                        _bar(context, 3),
                        _bar(context, 4),
                        _bar(context, 5),
                        _bar(context, 3),
                        _bar(context, 4.5),
                        _bar(context, 4),
                        _bar(context, 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getButtonText(FocusState state) {
    if (state is FocusRunning) return 'Pause Focus';
    if (state is FocusPaused) return 'Resume Focus';
    return 'Start Focus';
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: const SizedBox.shrink(),
      title: Text('Focus', style: context.typography.h5Medium),
    );
  }

  BarChartGroupData _bar(BuildContext context, double value) {
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
}
