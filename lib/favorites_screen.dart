
import 'package:flutter/material.dart';
import 'favorite_provider.dart';
import 'nature_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: AnimatedBuilder(
        animation: provider,
        builder: (context, child) {
          final favorites = provider.favorites;

          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No Favorites Yet!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Add plants and animals to your favorites.'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final item = favorites[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),

                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item['image'] ?? '',
                      width: 65,
                      height: 65,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported,
                          size: 50,
                        );
                      },
                    ),
                  ),

                  title: Text(
                    item['name'] ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    item['scientificName'] ?? '',
                  ),

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      provider.toggleFavorite(item);
                    },
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NatureDetailsScreen(item: item),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
