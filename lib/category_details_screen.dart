
import 'package:flutter/material.dart';
import 'plant_data.dart';
import 'animal_data.dart';
import 'nature_details_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool isPlant;

  const CategoryDetailsScreen({
    super.key,
    required this.title,
    required this.items,
    required this.isPlant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,

        itemBuilder: (context, index) {
          final itemName = items[index];

          final dataList = isPlant ? plantData : animalData;

          final selectedItem = dataList.firstWhere(
                (item) =>
            item['name'].toString().toLowerCase() ==
                itemName.toLowerCase() &&
                item['type'] == title,
            orElse: () => {},
          );

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,

            child: ListTile(
              contentPadding: const EdgeInsets.all(10),

              leading: selectedItem.isNotEmpty
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  selectedItem['image'],
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported);
                  },
                ),
              )
                  : const Icon(Icons.eco, size: 40),

              title: Text(
                itemName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF347A45),
              ),

              onTap: () {
                if (selectedItem.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$itemName information not found'),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NatureDetailsScreen(
                      item: selectedItem,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
