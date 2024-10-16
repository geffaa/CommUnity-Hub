// lib/presentation/views/map/map_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<MapEntity> entities = [
    MapEntity("Pusat Komunitas", 100, 100),
    MapEntity("Taman Kota", 150, 200),
    MapEntity("Perpustakaan Umum", 80, 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta Komunitas', style: GoogleFonts.poppins()),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.green[100], // Background color sebagai representasi peta
            child: Center(
              child: Text('Peta Komunitas', style: GoogleFonts.poppins(fontSize: 24)),
            ),
          ),
          for (var entity in entities)
            Positioned(
              left: entity.x.toDouble(),
              top: entity.y.toDouble(),
              child: GestureDetector(
                onTap: () => _showEntityInfo(entity),
                child: Icon(Icons.location_on, color: Colors.red, size: 30),
              ),
            ),
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              child: Icon(Icons.add_location),
              onPressed: _showAddEntityDialog,
            ),
          ),
        ],
      ),
    );
  }

  void _showEntityInfo(MapEntity entity) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(entity.name, style: GoogleFonts.poppins()),
          content: Text('Ini adalah ${entity.name}', style: GoogleFonts.poppins()),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddEntityDialog() {
    String newEntityName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Entitas Komunitas', style: GoogleFonts.poppins()),
          content: TextField(
            decoration: InputDecoration(hintText: "Nama entitas"),
            onChanged: (value) {
              newEntityName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Tambah'),
              onPressed: () {
                if (newEntityName.isNotEmpty) {
                  setState(() {
                    entities.add(MapEntity(newEntityName, 
                      100 + (entities.length * 50) % 200, 
                      100 + (entities.length * 70) % 300));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class MapEntity {
  final String name;
  final double x;
  final double y;

  MapEntity(this.name, this.x, this.y);
} 