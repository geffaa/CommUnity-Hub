import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, User!',
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildImpactCard(),
            SizedBox(height: 20),
            Text(
              'Aksi Cepat',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            _buildQuickActions(),
            SizedBox(height: 20),
            Text(
              'Acara Mendatang',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            _buildUpcomingEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dampak Anda',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildImpactItem(Icons.eco, '50 kg', 'CO2 Dikurangi'),
                _buildImpactItem(Icons.recycling, '30 kg', 'Sampah Didaur Ulang'),
                _buildImpactItem(Icons.volunteer_activism, '5', 'Proyek Dibantu'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.green),
        SizedBox(height: 5),
        Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildQuickActionItem(Icons.shopping_cart, 'Jual Barang'),
        _buildQuickActionItem(Icons.volunteer_activism, 'Donasi'),
        _buildQuickActionItem(Icons.event, 'Buat Acara'),
        _buildQuickActionItem(Icons.forum, 'Buat Diskusi'),
      ],
    );
  }

  Widget _buildQuickActionItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(label, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }

  Widget _buildUpcomingEvents() {
    return Card(
      child: Column(
        children: List.generate(3, (index) {
          return ListTile(
            leading: Icon(Icons.event),
            title: Text('Nama Acara ${index + 1}', style: GoogleFonts.poppins()),
            subtitle: Text('Tanggal Acara', style: GoogleFonts.poppins()),
            trailing: ElevatedButton(
              child: Text('Daftar'),
              onPressed: () {
                // TODO: Implement event registration
              },
            ),
          );
        }),
      ),
    );
  }
}