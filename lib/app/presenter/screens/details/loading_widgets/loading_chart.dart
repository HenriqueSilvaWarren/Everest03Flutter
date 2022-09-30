import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/day_button.dart';

class LoadingChart extends StatelessWidget {
  const LoadingChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> selectedIndex = [true, false, false, false, false];
    List<DayButton> daysButtons = [
      DayButton(text: "5D", selectedIndex: selectedIndex[0]),
      DayButton(text: "15D", selectedIndex: selectedIndex[1]),
      DayButton(text: "30D", selectedIndex: selectedIndex[2]),
      DayButton(text: "45D", selectedIndex: selectedIndex[3]),
      DayButton(text: "90D", selectedIndex: selectedIndex[4]),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Shimmer(
        gradient: LinearGradient(colors: [
          Colors.grey.shade300,
          Colors.grey.shade200,
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      color: const Color.fromRGBO(238, 46, 93, 1),
                      dotData: FlDotData(show: false),
                      barWidth: 3,
                      spots: [
                        const FlSpot(0, 0),
                        const FlSpot(1, 5),
                        const FlSpot(2, 3),
                        const FlSpot(3, 9),
                        const FlSpot(4, 12),
                      ],
                    )
                  ],
                  borderData: FlBorderData(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 0),
                swapAnimationCurve: Curves.easeIn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 30,
                child: ToggleButtons(
                  constraints: const BoxConstraints(),
                  fillColor: Colors.transparent,
                  selectedColor: Colors.black,
                  splashColor: Colors.transparent,
                  onPressed: (index) {},
                  renderBorder: false,
                  borderRadius: BorderRadius.circular(20),
                  isSelected: selectedIndex,
                  children: daysButtons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
