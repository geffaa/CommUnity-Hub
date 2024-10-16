import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komunitas', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCommunityCard(
            'Komunitas Peduli Lingkungan',
            'Bergabunglah dalam upaya pelestarian lingkungan di sekitar kita.',
            Icons.eco,
            Colors.green,
          ),
          SizedBox(height: 16),
          _buildCommunityCard(
            'Komunitas Pengembang Lokal',
            'Kembangkan potensi dan berinovasi bersama pengembang lokal.',
            Icons.code,
            Colors.blue,
          ),
          SizedBox(height: 16),
          _buildCommunityCard(
            'Komunitas Seni dan Budaya',
            'Jelajahi dan lestarikan kekayaan seni dan budaya lokal.',
            Icons.palette,
            Colors.purple,
          ),
          SizedBox(height: 16),
          _buildCommunityCard(
            'Komunitas Wirausaha Muda',
            'Bangun jaringan dan kembangkan bisnis bersama wirausahawan muda.',
            Icons.business,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 32),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement join community functionality
              },
              child: Text('Bergabung', style: GoogleFonts.poppins()),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}