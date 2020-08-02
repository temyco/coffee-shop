import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/viewdata/radar_chart_view_data.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:mp_chart/mp/chart/radar_chart.dart';
import 'package:mp_chart/mp/controller/radar_chart_controller.dart';
import 'package:mp_chart/mp/core/data/radar_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_radar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/radar_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/radar_entry.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';

class CoffeeTasteChart extends StatefulWidget {
  @required final RadarChartViewData _radarChartViewData;

  CoffeeTasteChart(this._radarChartViewData);

  @override
  State createState() {
    return CoffeeTasteChartState(_radarChartViewData);
  }
}

class CoffeeTasteChartState extends State<CoffeeTasteChart> {
  @required final RadarChartViewData _radarChartViewData;

  RadarChartController _chartController;

  CoffeeTasteChartState(this._radarChartViewData);

  @override
  void initState() {
    _initChartController();
    _initRadarData(_prepareDataSets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RadarChart(_chartController);
  }

  void _initChartController() {
    _chartController = RadarChartController(
        yAxisSettingFunction: (yAxis, controller) {
          yAxis
            ..setLabelCount2(_radarChartViewData.labels.length, true)
            ..setAxisMinimum(AXIS_MINIMUM)
            ..setAxisMaximum(AXIS_MAXIMUM)
            ..drawLabels = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..textColor = _radarChartViewData.labelsTextColor
            ..textSize = _radarChartViewData.labelsTextSize
            ..setValueFormatter(
                CoffeeTasteValueFormatter(_radarChartViewData.labels));
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = false;
        },
        webLineWidth: WEB_LINE_WIDTH,
        innerWebLineWidth: INNER_WEB_LINE_WIDTH,
        webColor: WEB_LINE_COLOR,
        webColorInner: _radarChartViewData.lineColor,
        description: Description()
          ..enabled = false);
  }

  List<IRadarDataSet> _prepareDataSets() {
    List<IRadarDataSet> dataSets = List();
    for(int i = 0; i < _radarChartViewData.data.length; i++) {
      List<RadarEntry> entries = List();
      for (var value in _radarChartViewData.data[i]) {
        entries.add(RadarEntry(value: value));
      }

      RadarDataSet set = RadarDataSet(entries, "");

      /// TODO: set selected/unselected color depending on bloc when it's implemented
      set.setColor1(AppColors.dark);
      set.setFillColor(AppColors.dark);
      set.setDrawFilled(true);
      set.setFillAlpha(FILL_ALPHA_TOP_LAYER);
      set.setDrawHighlightCircleEnabled(false);
      set.setDrawHighlightIndicators(false);

      dataSets.add(set);
    }

    return dataSets;
  }

  void _initRadarData(List<IRadarDataSet> dataSets) {
    _chartController.data = RadarData.fromList(dataSets);
    _chartController.drawMarkers = false;
    _chartController.rotateEnabled = false;
    _chartController.data
      ..setDrawValues(false);

    setState(() {});
  }
}

class CoffeeTasteValueFormatter extends ValueFormatter {
  final List<String> _values;

  CoffeeTasteValueFormatter(this._values);

  @override
  String getFormattedValue1(double value) {
    return _values[value.toInt() % _values.length].toUpperCase();
  }
}

const double AXIS_MINIMUM = 0;
const double AXIS_MAXIMUM = 5;
const double WEB_LINE_WIDTH = 0.0;
const double INNER_WEB_LINE_WIDTH = 1.0;
const Color WEB_LINE_COLOR = Colors.white;
const int FILL_ALPHA_TOP_LAYER = 255;
const int FILL_ALPHA_BOTTOM_LAYER = 180;