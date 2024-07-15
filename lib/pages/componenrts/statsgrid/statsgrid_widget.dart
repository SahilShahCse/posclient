import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsgridWidget extends StatefulWidget {
  const StatsgridWidget({super.key});

  @override
  State<StatsgridWidget> createState() => _StatsgridWidgetState();
}

class _StatsgridWidgetState extends State<StatsgridWidget> {

  // static data for demonstration
  final List<Map<String, dynamic>> stats = [
    {
      'title': 'Revenue\nCollection',
      'value': 'RM.147',
      'imagePath': 'assets/images/money-bag.png',
    },
    {
      'title': 'Total \nBookings',
      'value': '20',
      'imagePath': 'assets/images/taxi.png',
    },
    {
      'title': 'Available\nSpace',
      'value': '67',
      'imagePath': 'assets/images/reserved_12510438.png',
    },
    {
      'title': 'Total\nCapacity',
      'value': '100',
      'imagePath': 'assets/images/money-bag.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        const Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Text(
              'Status',
              style: TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(14.0),
          child: GridView.builder(
            itemCount: stats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var stat = stats[index];
              return _buildCard(context, stat);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> stat) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                  child: Expanded(
                    child: Text(
                      stat['title'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Ubuntu',
                        fontSize: 19.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      stat['imagePath'],
                      width: 47.0,
                      height: 68.0,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  ),
                ],

                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  stat['value'],
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Ubuntu',
                    letterSpacing: 0.0,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
