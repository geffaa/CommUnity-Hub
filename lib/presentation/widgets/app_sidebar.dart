// lib/presentation/widgets/app_sidebar.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'CommUnity Hub',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to Dashboard
            },
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Forum Kebijakan', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to Policy Forum
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Kalender Acara', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to Event Calendar
            },
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Rekomendasi AI', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to AI Recommendations
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Gamifikasi Dampak', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to Impact Gamification
            },
          ),
        ],
      ),
    );
  }
}