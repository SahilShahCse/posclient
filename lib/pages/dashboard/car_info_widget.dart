import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class CarInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.carAlt,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 40.0,
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cars:',
                  style: FlutterFlowTheme.of(context).headlineMedium.copyWith(
                    fontFamily: 'Ubuntu',
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  '65',
                  style: FlutterFlowTheme.of(context).headlineLarge.copyWith(
                    fontFamily: 'Ubuntu',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 8.0,
            animation: true,
            percent: 0.89,
            center: Text(
              '89%',
              style: FlutterFlowTheme.of(context).headlineSmall.copyWith(
                fontFamily: 'Ubuntu',
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            progressColor: FlutterFlowTheme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
