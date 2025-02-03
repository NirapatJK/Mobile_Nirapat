import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoritePage(),
    );
  }
}

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<String> favoriteItems = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  List<bool> isFavorited = List.generate(5, (index) => false); // เก็บสถานะชอบ/ไม่ชอบ

  // ฟังก์ชันการกดหัวใจ
  void toggleFavorite(int index) {
    setState(() {
      isFavorited[index] = !isFavorited[index];
    });

    // แสดงข้อความที่เกี่ยวข้องกับการกดหัวใจ
    String message = isFavorited[index] ? "Added to favorites!" : "Removed from favorites!";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            return FavoriteCard(
              item: favoriteItems[index],
              isFavorited: isFavorited[index],
              onTap: () => toggleFavorite(index),
            );
          },
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String item;
  final bool isFavorited;
  final VoidCallback onTap;

  FavoriteCard({
    required this.item,
    required this.isFavorited,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // ตรงกลางเป็นภาพสินค้าต่างๆ
            Center(
              child: Image.asset(
                'assets/product_image.png', // ใส่ path ของภาพสินค้า
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            // ตำแหน่งของไอคอนหัวใจที่มุมขวาล่าง
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? Colors.red : Colors.deepPurple,
                  size: 30,
                ),
                onPressed: onTap,
              ),
            ),
            // ใส่ชื่อสินค้าด้านล่าง
            Positioned(
              bottom: 50,
              left: 10,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
