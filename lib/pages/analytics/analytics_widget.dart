import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analytics_model.dart';
export 'analytics_model.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({super.key});

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  late AnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(

        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: true,
          title: Text(
            'Analytics ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Peak Hours',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).lightpurple,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: 392.0,
                        height: 230.0,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              yData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).purple,
                                barWidth: 3.0,
                                isCurved: true,
                                preventCurveOverShooting: true,
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            showGrid: true,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderWidth: 1.0,
                          ),
                          axisBounds: AxisBounds(
                            maxX: 100.0,
                            maxY: 100.0,
                          ),
                          xAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: TextStyle(),
                            labelInterval: 10.0,
                            reservedSize: 32.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelInterval: 10.0,
                            reservedSize: 40.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Vehicle Distribution',
                        style:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).lightgreen,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: 392.0,
                        height: 230.0,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              color: FlutterFlowTheme.of(context).green,
                            )
                          ],
                          xLabels: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10))
                              .map((e) => e.toString())
                              .toList(),
                          barWidth: 10.0,
                          barBorderRadius: BorderRadius.circular(8.0),
                          groupSpace: 8.0,
                          alignment: BarChartAlignment.spaceAround,
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            showGrid: true,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderWidth: 1.0,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            reservedSize: 28.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            reservedSize: 42.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Monthly Collection',
                        style:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).lightred,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: 392.0,
                        height: 230.0,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              yData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).redd,
                                barWidth: 3.0,
                                isCurved: true,
                                preventCurveOverShooting: true,
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            showGrid: true,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderWidth: 1.0,
                          ),
                          axisBounds: AxisBounds(
                            maxX: 100.0,
                            maxY: 100.0,
                          ),
                          xAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: TextStyle(),
                            labelInterval: 10.0,
                            reservedSize: 32.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelInterval: 10.0,
                            reservedSize: 40.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
