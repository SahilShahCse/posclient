import '../button_nav/button_nav_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componenrts/button_nav/button_nav_widget.dart';
import '/pages/componenrts/topbar/topbar_widget.dart';
import 'img_but_nav_widget.dart' show ImgButNavWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImgButNavModel extends FlutterFlowModel<ImgButNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for topbar component.
  late TopbarModel topbarModel;
  // Model for button_nav component.
  late ButtonNavModel buttonNavModel;

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    buttonNavModel = createModel(context, () => ButtonNavModel());
  }

  @override
  void dispose() {
    topbarModel.dispose();
    buttonNavModel.dispose();
  }
}
