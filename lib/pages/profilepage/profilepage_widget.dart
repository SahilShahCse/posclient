import 'package:flutter/material.dart';
import 'package:posclient/pages/profilepage/profilepage_model.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/qrgen_widget.dart';

class ProfilepageWidget extends StatefulWidget {
  const ProfilepageWidget({super.key});

  @override
  State<ProfilepageWidget> createState() => _ProfilepageWidgetState();
}

class _ProfilepageWidgetState extends State<ProfilepageWidget> {
  late ProfilepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilepageModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.black,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Welcome, ${currentUser?.displayName ?? 'Guest'}!',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
              background: CachedNetworkImage(
                imageUrl:
                'https://images.unsplash.com/photo-1691689380376-025c287915fc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8Y2FsbWluZyUyMG5hdHVyZXxlbnwwfHx8fDE3MjA2NzI1MjF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildProfileSection(),
                _buildSettingsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() => Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: currentUser?.photoUrl == null ? Colors.teal : null,
                child: currentUser?.photoUrl != null
                    ? Image.network(currentUser!.photoUrl!)
                    : Icon(Icons.person, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              currentUser?.displayName ?? 'Guest',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          '${currentUser?.email ?? 'No Email Data Available'} ',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black),
        ),
        SizedBox(height: 20),
        _buildTile(
          icon: Icons.account_circle,
          title: 'Edit Profile',
        ),
        _buildTile(
          icon: Icons.notifications,
          title: 'Notifications',
        ),
        _buildTile(
          icon: Icons.qr_code_scanner,
          title: 'Show QR Code',
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return QrgenWidget();
              },
            );
          },
        ),
        _buildTile(
          icon: Icons.lock_outline,
          title: 'Privacy & Security',
        ),
      ],
    ),
  );

  Widget _buildSettingsSection() => Container(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black),
        ),
        SizedBox(height: 10),
        _buildTile(
          icon: Icons.help_outline,
          title: 'Help & Feedback',
        ),
        _buildTile(
          icon: Icons.info_outline,
          title: 'About',
        ),
        _buildTile(
          icon: Icons.logout,
          title: 'Log Out',
          onTap: () async {
            await authManager.signOut();
            // Navigate to login screen or perform other post-logout actions
          },
        ),
      ],
    ),
  );

  Widget _buildTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) =>
      ListTile(
        leading: Icon(icon, color: FlutterFlowTheme.of(context).secondaryColor),
        title: Text(title),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
      );
}
