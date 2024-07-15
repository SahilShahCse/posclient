import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componenrts/button_nav/button_nav_widget.dart';
import '/pages/componenrts/topbar/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'img_but_nav_model.dart';
export 'img_but_nav_model.dart';

class ImgButNavWidget extends StatefulWidget {
  const ImgButNavWidget({super.key});

  @override
  State<ImgButNavWidget> createState() => _ImgButNavWidgetState();
}

class _ImgButNavWidgetState extends State<ImgButNavWidget> {
  late ImgButNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImgButNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: wrapWithModel(
            model: _model.topbarModel,
            updateCallback: () => setState(() {}),
            child: TopbarWidget(),
          ),
        ),
        wrapWithModel(
          model: _model.buttonNavModel,
          updateCallback: () => setState(() {}),
          child: ButtonNavWidget(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/vnimc_1.png',
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
