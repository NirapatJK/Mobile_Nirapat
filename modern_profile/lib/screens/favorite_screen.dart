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
  final List<Map<String, String>> favoriteItems = [
    {"name": "Apple", "image": "assets/product_1.jpg", "price": "\$5"},
    {"name": "Grape", "image": "assets/product_2.jpg", "price": "\$3"},
    {"name": "Orange", "image": "assets/product_3.jpg", "price": "\$4"},
    {"name": "Pineapple", "image": "assets/product_4.jpg", "price": "\$6"},
  ];

  List<bool> isFavorited = List.generate(4, (index) => false);

  void toggleFavorite(int index) {
    setState(() {
      isFavorited[index] = !isFavorited[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
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
              item: favoriteItems[index]['name']!,
              image: favoriteItems[index]['image']!,
              isFavorited: isFavorited[index],
              onTap: () => toggleFavorite(index),
              price: favoriteItems[index]['price']!,
              onViewDetail: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      itemName: favoriteItems[index]['name']!,
                      itemImage: favoriteItems[index]['image']!,
                      itemPrice: favoriteItems[index]['price']!,
                      isFavorited: isFavorited[index],
                      onFavoriteToggle: (bool isFavorited) {
                        setState(() {
                          this.isFavorited[index] = isFavorited;
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String item;
  final String image;
  final bool isFavorited;
  final VoidCallback onTap;
  final String price;
  final VoidCallback onViewDetail;

  FavoriteCard({
    required this.item,
    required this.image,
    required this.isFavorited,
    required this.onTap,
    required this.price,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewDetail,  
      child: Card(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                    size: 40,
                  ),
                  onPressed: onTap,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemPrice;
  final bool isFavorited;
  final Function(bool) onFavoriteToggle;

  ProductDetailScreen({
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.itemImage, width: 200, height: 200),
              SizedBox(height: 20),
              Text(
                widget.itemName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Price: ${widget.itemPrice}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              IconButton(
                icon: Icon(
                  _isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorited ? Colors.red : Colors.grey,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                  widget.onFavoriteToggle(_isFavorited);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);  
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
