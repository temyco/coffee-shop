import 'package:flutter/material.dart';

class RadarChartViewData {
  @required List<List<double>> data;
  @required List<String> labels;
  Color labelsTextColor;
  double labelsTextSize;
  Color lineColor;
  Color selectedSetColor;
  Color unselectedSetColor;

  RadarChartViewData(this.data, this.labels, this.labelsTextColor,
      this.labelsTextSize, this.lineColor, this.selectedSetColor, this.unselectedSetColor);
}