import '/components/qrgen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'qrcodegen_widget.dart' show QrcodegenWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QrcodegenModel extends FlutterFlowModel<QrcodegenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for qrgen component.
  late QrgenModel qrgenModel;

  @override
  void initState(BuildContext context) {
    qrgenModel = createModel(context, () => QrgenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    qrgenModel.dispose();
  }
}
