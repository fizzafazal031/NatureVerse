
import 'package:flutter/material.dart';
import 'plant_data.dart';
import 'animal_data.dart';
import 'nature_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController =
  TextEditingController();

  List<Map<String, dynamic>> searchResults = [];

  void searchNature(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        searchResults = [];
      } else {
        final allData = [
          ...plantData,
          ...animalData,
        ];

        searchResults = allData.where((item) {
          final name = item['name'].toString().toLowerCase();
          final scientificName =
          item['scientificName'].toString().toLowerCase();
          final type = item['type'].toString().toLowerCase();

          final searchText = query.toLowerCase().trim();

          return name.contains(searchText) ||
              scientificName.contains(searchText) ||
              type.contains(searchText);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Nature'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: searchNature,
              decoration: InputDecoration(
                hintText: 'Search plants or animals...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF347A45),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchNature('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFF347A45),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: searchController.text.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.travel_explore,
                    size: 80,
                    color: Color(0xFF347A45),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Explore the World of Nature',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Search for plants and animals',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
                : searchResults.isEmpty
                ? const Center(
              child: Text(
                'No results found!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final item = searchResults[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        item['image'],
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const SizedBox(
                            width: 75,
                            height: 75,
                            child: Icon(
                              Icons.image_not_supported,
                            ),
                          );
                        },
                      ),
                    ),

                    title: Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(item['scientificName']),
                        const SizedBox(height: 4),
                        Text(
                          item['type'],
                          style: const TextStyle(
                            color: Color(0xFF347A45),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
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
            ),
          ),
        ],
      ),
    );
  }
}
