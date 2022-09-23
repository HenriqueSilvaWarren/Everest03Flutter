// ignore: unused_import
import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/get_crypto_model_for_details_screen.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/get_price_from_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/get_real.dart';
import 'day_button.dart';

class CustomLineChart extends StatefulHookConsumerWidget {
  const CustomLineChart({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends ConsumerState<CustomLineChart> {
  late Map<String, List<FlSpot>> spotsMap;
  
  late String values;

  late List<FlSpot> spotsList;

  List<bool> selectedIndex = [true, false, false, false, false];

  @override
  void initState() {
    super.initState();
    spotsMap = ref.read(getCryptoModelForDetailsScreen).prices;
    spotsList = spotsMap['5D']!;
  }

  @override
  Widget build(BuildContext context) {
    var stateGetPrice = ref.read(getPriceFromChartStateProvider.state);
    List<DayButton> daysButtons = [
      DayButton(text: "5D", selectedIndex: selectedIndex[0]),
      DayButton(text: "15D", selectedIndex: selectedIndex[1]),
      DayButton(text: "30D", selectedIndex: selectedIndex[2]),
      DayButton(text: "45D", selectedIndex: selectedIndex[3]),
      DayButton(text: "90D", selectedIndex: selectedIndex[4]),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      touchCallback: (p0, p1) {
                        if (!p0.isInterestedForInteractions) {
                          setState(
                            () {
                              stateGetPrice.state = getReal(spotsList.last.y);
                            },
                          );
                        } else {
                          if (p1?.lineBarSpots?[0].spotIndex != null) {
                            setState(
                              () {
                                stateGetPrice.state = getReal(
                                    spotsList[p1!.lineBarSpots![0].spotIndex]
                                        .y);
                              },
                            );
                          }
                        }
                      },
                      getTouchLineEnd: (barData, spotIndex) => double.infinity,
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
                                    color: const Color.fromRGBO(238, 46, 93, 1),
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
                                  days: listPosX[touchedSpot.spotIndex].toInt(),
                                ),
                              );
                              initializeDateFormatting();
                              var string =
                                  DateFormat('dd MMM y', 'pt_BR').format(date);
                              return LineTooltipItem(
                                string,
                                textStyle,
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
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
                          spotsList = spotsMap[daysButtons[index].text]!;
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
    );
  }
}
