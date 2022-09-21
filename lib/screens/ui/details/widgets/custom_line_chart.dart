import 'package:brasil_fields/brasil_fields.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/animated_hide_text_value.dart';
import '../utils/line_chart_min_max_values.dart';
import 'day_button.dart';

class CustomLineChart extends StatefulHookConsumerWidget {
  const CustomLineChart({Key? key, required this.spotsMap}) : super(key: key);
  final Map<String, List<FlSpot>> spotsMap;

  @override
  ConsumerState<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends ConsumerState<CustomLineChart> {
  late String values;

  late List<FlSpot> spotsList;
  late LineChartMinMaxValues lineChartData;
  List<bool> selectedIndex = [true, false, false, false, false];

  @override
  void initState() {
    super.initState();
    spotsList = widget.spotsMap['5D']!;
    lineChartData = LineChartMinMaxValues(selectedList: spotsList.toList());
    values = UtilBrasilFields.obterReal(spotsList.last.y);
  }

  @override
  Widget build(BuildContext context) {
    List<DayButton> daysButtons = [
      DayButton(text: "5D", selectedIndex: selectedIndex[0]),
      DayButton(text: "15D", selectedIndex: selectedIndex[1]),
      DayButton(text: "30D", selectedIndex: selectedIndex[2]),
      DayButton(text: "45D", selectedIndex: selectedIndex[3]),
      DayButton(text: "90D", selectedIndex: selectedIndex[4]),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedHideTextValue(
            text: values,
            style: GoogleFonts.sourceSansPro(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 27 / 9,
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        touchCallback: (p0, p1) {
                          if (p0.runtimeType == FlTapUpEvent ||
                              p0.runtimeType == FlPanEndEvent ||
                              p0.runtimeType == FlLongPressEnd) {
                            setState(
                              () {
                                values = UtilBrasilFields.obterReal(
                                    spotsList.last.y);
                              },
                            );
                          } else {
                            if (p1?.lineBarSpots?[0].spotIndex != null) {
                              setState(
                                () {
                                  values = UtilBrasilFields.obterReal(
                                      spotsList[p1!.lineBarSpots![0].spotIndex]
                                          .y);
                                },
                              );
                            }
                          }
                        },
                        getTouchLineEnd: (barData, spotIndex) =>
                            double.infinity,
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> indicators) {
                          return indicators.map(
                            (int index) {
                              final line = FlLine(
                                color: const Color.fromRGBO(238, 46, 93, 1),
                                strokeWidth: 1,
                                dashArray: [4, 4],
                              );
                              return TouchedSpotIndicatorData(
                                line,
                                FlDotData(
                                  show: true,
                                  getDotPainter: (p0, p1, p2, p3) {
                                    return FlDotCirclePainter(
                                      color:
                                          const Color.fromRGBO(238, 46, 93, 1),
                                      radius: 3,
                                      strokeWidth: 0,
                                    );
                                  },
                                ),
                              );
                            },
                          ).toList();
                        },
                        enabled: true,
                        touchTooltipData: LineTouchTooltipData(
                          tooltipMargin: 0,
                          fitInsideHorizontally: true,
                          tooltipPadding: const EdgeInsets.only(bottom: 5),
                          showOnTopOfTheChartBoxArea: true,
                          tooltipBgColor: Colors.transparent,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map(
                              (LineBarSpot touchedSpot) {
                                const textStyle = TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                );
                                List<FlSpot> list = spotsList;
                                List<double> listPosX = list
                                    .map(
                                      (e) => ((e.x + 1) - list.length) * -1,
                                    )
                                    .toList();

                                var date = DateTime.now().subtract(
                                  Duration(
                                    days:
                                        listPosX[touchedSpot.spotIndex].toInt(),
                                  ),
                                );
                                initializeDateFormatting();
                                var string = DateFormat('dd MMM y', 'pt_BR')
                                    .format(date);
                                return LineTooltipItem(
                                  string,
                                  textStyle,
                                );
                              },
                            ).toList();
                          },
                        ),
                      ),
                      minY: lineChartData.minY,
                      minX: lineChartData.minX,
                      maxX: lineChartData.maxX,
                      maxY: lineChartData.maxY,
                      lineBarsData: [
                        LineChartBarData(
                          color: const Color.fromRGBO(238, 46, 93, 1),
                          dotData: FlDotData(show: false),
                          barWidth: 3,
                          spots: spotsList,
                        )
                      ],
                      borderData: FlBorderData(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
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
                      onPressed: (index) {
                        setState(
                          () {
                            for (int i = 0; i < selectedIndex.length; i++) {
                              selectedIndex[i] = i == index;
                            }
                            spotsList =
                                widget.spotsMap[daysButtons[index].text]!;
                            lineChartData = LineChartMinMaxValues(
                              selectedList: spotsList.toList(),
                            );
                          },
                        );
                      },
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
        ],
      ),
    );
  }
}
