import 'package:flutter/material.dart';
// TODO: Import charting library (e.g., fl_chart)

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dampak Komunitas'),
      ),
      body: ListView(
        children: [
          _buildImpactCard('Pengurangan Emisi CO2', '500 kg'),
          _buildImpactCard('Sampah Didaur Ulang', '1000 kg'),
          _buildImpactCard('Donasi Terkumpul', 'Rp 5.000.000'),
          // TODO: Add impact chart
        ],
      ),
    );
  }

  Widget _buildImpactCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}