import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bookings_model.dart';
export 'bookings_model.dart';

class BookingsWidget extends StatefulWidget {
  const BookingsWidget({super.key});

  @override
  State<BookingsWidget> createState() => _BookingsWidgetState();
}

class _BookingsWidgetState extends State<BookingsWidget> with SingleTickerProviderStateMixin {
  late BookingsModel _model;
  late TabController _tabController;
  late TextEditingController _searchController;

  List<String> allBookings = List.generate(10, (index) => 'Booking #${index + 1}'); // Sample data
  List<String> filteredBookings = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _searchController = TextEditingController();

    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(_filterBookings);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        filteredBookings = List.from(allBookings); // Initialize the filtered list
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterBookings() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredBookings = allBookings.where((booking) {
        return booking.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: true,
          title: Text(
            'Bookings',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Ubuntu',
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Active Bookings'),
              Tab(text: 'History'),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildActiveBookingsTab(),
              _buildHistoryTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActiveBookingsTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: ListTile(
            leading: Icon(
              Icons.local_activity_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            title: Text(
              'Active Bookings',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            horizontalTitleGap: 0,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBookingList(allBookings),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryTab() {
    return Column(
      children: [
        SizedBox(height: 24,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 6,),
        ListTile(
          leading: Icon(
            Icons.history_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),

          title: Text(
            'History',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          horizontalTitleGap: 0,  // Adjusts the space between the icon and the title
        ),
        SizedBox(height: 16,),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBookingList(filteredBookings),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildBookingList(List<String> bookings) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(bookings[index] , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 16 , color: Colors.black),),
          subtitle: Text('Details for ${bookings[index]}'),
        );
      },
    );
  }
}
