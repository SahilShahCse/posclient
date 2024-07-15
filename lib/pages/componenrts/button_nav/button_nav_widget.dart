import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ButtonNavWidget extends StatefulWidget {
  const ButtonNavWidget({super.key});

  @override
  _ButtonNavWidgetState createState() => _ButtonNavWidgetState();
}

class _ButtonNavWidgetState extends State<ButtonNavWidget> {
  Widget _navButton({required String text, required VoidCallback onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          text,
          style: FlutterFlowTheme.of(context).titleMedium.override(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navButton(
            text: 'Analytics',
            onPressed: () => context.pushNamed('analytics'),
          ),
          SizedBox(width: 10),
          _navButton(
            text: 'Bookings',
            onPressed: () => context.pushNamed('bookings'),
          ),
          SizedBox(width: 10),
          _navButton(
            text: 'Payments',
            onPressed: () => print('Payments Button Pressed'),
          ),
        ],
      ),
    );
  }
}
