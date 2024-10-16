import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_hub/domain/entities/product.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Semua';
  final List<String> _categories = ['Semua', 'Elektronik', 'Pakaian', 'Buku', 'Perabotan', 'Lainnya'];

  // Dummy data untuk produk
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Laptop Bekas Kondisi Prima',
      description: 'Laptop bekas dengan kondisi sangat baik, cocok untuk kerja atau kuliah.',
      price: 3000000,
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
      category: 'Elektronik',
      rewardPoints: 50,
    ),
    Product(
      id: '2',
      name: 'Jaket Denim Vintage',
      description: 'Jaket denim vintage ukuran M, kondisi terawat.',
      price: 250000,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5',
      category: 'Pakaian',
      rewardPoints: 25,
    ),
    Product(
      id: '3',
      name: 'Novel Bekas "Bumi Manusia"',
      description: 'Novel karya Pramoedya Ananta Toer, kondisi 90%.',
      price: 50000,
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f',
      category: 'Buku',
      rewardPoints: 10,
    ),
    Product(
      id: '4',
      name: 'Meja Kerja Minimalis',
      description: 'Meja kerja bekas pakai, cocok untuk ruang sempit.',
      price: 500000,
      imageUrl: 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd',
      category: 'Perabotan',
      rewardPoints: 40,
    ),
  ];

  List<Product> get filteredProducts {
    return _products.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Semua' || product.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // TODO: Implement refresh logic
              },
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(filteredProducts[index]);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Implement add new product/service
        },
        tooltip: 'Tambah Produk Baru',
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          hintText: 'Cari produk...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(_categories[index], style: GoogleFonts.poppins()),
              selected: _selectedCategory == _categories[index],
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = _categories[index];
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to product detail page
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: GoogleFonts.poppins(color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.eco, size: 16, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        '${product.rewardPoints} poin',
                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}