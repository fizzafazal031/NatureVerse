
import 'package:flutter/material.dart';
import 'favorite_provider.dart';

class NatureDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const NatureDetailsScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.instance;

    final details =
    Map<String, dynamic>.from(item['details'] ?? {});

    return Scaffold(
      appBar: AppBar(
        title: Text(item['name'] ?? 'Details'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
        actions: [
          AnimatedBuilder(
            animation: provider,
            builder: (context, child) {
              final isFav = provider.isFavorite(item['id']);

              return IconButton(
                onPressed: () {
                  provider.toggleFavorite(item);
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.white,
                  size: 28,
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // MAIN IMAGE
            Image.network(
              item['image'] ?? '',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.green.shade50,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 60,
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // NAME
                  Text(
                    item['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // SCIENTIFIC NAME
                  Text(
                    item['scientificName'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // CATEGORY
                  Chip(
                    label: Text(item['type'] ?? ''),
                    backgroundColor: Colors.green.shade100,
                  ),

                  const SizedBox(height: 20),

                  // DESCRIPTION
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    item['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // DETAILED INFORMATION
                  const Text(
                    'Detailed Information',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...details.entries.map((entry) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const Icon(
                          Icons.eco,
                          color: Color(0xFF347A45),
                        ),
                        title: Text(
                          entry.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          entry.value.toString(),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  // FAVORITES BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: AnimatedBuilder(
                      animation: provider,
                      builder: (context, child) {
                        final isFav =
                        provider.isFavorite(item['id']);

                        return ElevatedButton.icon(
                          onPressed: () async {
                            await provider.toggleFavorite(item);

                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFav
                                      ? 'Removed from Favorites'
                                      : 'Added to Favorites',
                                ),
                                duration:
                                const Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Icon(
                            isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          label: Text(
                            isFav
                                ? 'Remove from Favorites'
                                : 'Add to Favorites',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF347A45),
                            foregroundColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
