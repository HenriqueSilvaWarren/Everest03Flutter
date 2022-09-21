import 'package:fl_chart/fl_chart.dart';

class LineChartMinMaxValues {
  final List<FlSpot>? selectedList;
  LineChartMinMaxValues({
    required this.selectedList,
  }) {
    Map<String, List> minMaxValues = {
      "xValues": _getXMinMaxValues(),
      "yValues": _getYMinMaxValues(),
    };

    minX = minMaxValues["xValues"]!.first;
    maxX = minMaxValues["xValues"]!.last;
    minY = minMaxValues["yValues"]!.first;
    maxY = minMaxValues["yValues"]!.last;
  }

  late double minX;
  late double maxX;

  late double minY;
  late double maxY;

  List<double> _getYMinMaxValues() {
    selectedList!.sort(
      (a, b) {
        return a.y.compareTo(b.y);
      },
    );

    return [selectedList!.first.y, selectedList!.last.y];
  }

  List<double> _getXMinMaxValues() {
    selectedList!.sort(
      (a, b) {
        return a.x.compareTo(b.x);
      },
    );

    return [selectedList!.first.x, selectedList!.last.x];
  }
}
