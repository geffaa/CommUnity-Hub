import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          _buildProfileOption('Keterampilan Saya', Icons.build),
          _buildProfileOption('Pencapaian', Icons.emoji_events),
          _buildProfileOption('Pengaturan', Icons.settings),
          _buildProfileOption('Bantuan', Icons.help),
          _buildProfileOption('Keluar', Icons.exit_to_app),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(height: 16),
          Text(
            'Nama Pengguna',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('user@email.com'),
        ],
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to option screen
      },
    );
  }
}