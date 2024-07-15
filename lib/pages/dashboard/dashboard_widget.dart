import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componenrts/img_but_nav/img_but_nav_widget.dart';
import '/pages/componenrts/statsgrid/statsgrid_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.imgButNavModel,
                            updateCallback: () => setState(() {}),
                            child: ImgButNavWidget(),
                          ),
                          SizedBox(height: 5),
                          wrapWithModel(
                            model: _model.statsgridModel,
                            updateCallback: () => setState(() {}),
                            child: StatsgridWidget(),
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'Vehicle Distribution',
                              style: TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Column(
                        children: [
                          _vehicleInfoSection(context, "Cars", 65, 0.85, Colors.blueGrey, FontAwesomeIcons.car),
                          _vehicleInfoSection(context, "Bikes", 14, 0.5, Colors.teal, FontAwesomeIcons.biking),
                          SizedBox(height: 75),
                        ],
                      ),

                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 60.0,
                      borderWidth: 2.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).accent1,
                      icon: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 35.0,
                      ),
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.qrdata = await FlutterBarcodeScanner.scanBarcode(
                          '#C62828', // scanning line color
                          'Cancel', // cancel button text
                          true, // whether to show the flash icon
                          ScanMode.QR,
                        );

                        _shouldSetState = true;
                        _model.qrjson = await actions.stringtojsonparsor(
                          _model.qrdata,
                        );
                        _shouldSetState = true;
                        if (currentUserUid ==
                            getJsonField(
                              _model.qrjson,
                              r'''$["lot_uid"]''',
                            ).toString()) {
                          _model.query =
                              await queryActiveTransactionsRecordOnce(
                            parent: currentUserReference,
                            queryBuilder: (activeTransactionsRecord) =>
                                activeTransactionsRecord.where(
                              'carduid',
                              isEqualTo: '',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;
                          if (_model.query?.carduid ==
                              getJsonField(
                                _model.qrjson,
                                r'''$["card_uid"]''',
                              ).toString()) {
                            context.pushNamed(
                              'OUT_entry',
                              queryParameters: {
                                'carduid': serializeParam(
                                  getJsonField(
                                    _model.qrjson,
                                    r'''$["card_uid"]''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            context.pushNamed(
                              'in_entry',
                              queryParameters: {
                                'carduid': serializeParam(
                                  getJsonField(
                                    _model.qrjson,
                                    r'''$["card_uid"]''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            if (_shouldSetState) setState(() {});
                            return;
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Invalid QrCode',
                                style: GoogleFonts.getFont(
                                  'Ubuntu',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                    ).animateOnPageLoad(
                        animationsMap['iconButtonOnPageLoadAnimation']!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _vehicleInfoSection(
      BuildContext context,
      String vehicleType,
      int count,
      double percent,
      Color color,
      IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 10 , right: 16 , left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 8,
              percent: percent,
              center: Icon(icon, size: 30, color: color),
              progressColor: color,
              backgroundColor: Colors.grey[300]!,
            ),
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$vehicleType : $count',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                Text(
                  '${(percent * 100).toInt()}% Utilization',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

