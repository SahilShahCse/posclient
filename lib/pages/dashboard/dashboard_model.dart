import '../componenrts/statsgrid/statsgrid_model.dart';
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
import 'dashboard_widget.dart' show DashboardWidget;
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

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String carduid = '0000';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for img_but_nav component.
  late ImgButNavModel imgButNavModel;
  // Model for statsgrid component.
  late StatsgridModel statsgridModel;
  var qrdata = '';
  // Stores action output result for [Custom Action - stringtojsonparsor] action in IconButton widget.
  dynamic? qrjson;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ActiveTransactionsRecord? query;

  @override
  void initState(BuildContext context) {
    imgButNavModel = createModel(context, () => ImgButNavModel());
    statsgridModel = createModel(context, () => StatsgridModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    imgButNavModel.dispose();
    statsgridModel.dispose();
  }
}
