
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageIdentificationScreen extends StatefulWidget {
  const ImageIdentificationScreen({super.key});

  @override
  State<ImageIdentificationScreen> createState() =>
      _ImageIdentificationScreenState();
}

class _ImageIdentificationScreenState
    extends State<ImageIdentificationScreen> {

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void identifyImage() {
    if (selectedImage == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Image selected! AI identification will be connected soon.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Identification'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Nature Image Identifier 🌿',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Identify plants, insects, animals, birds, '
                  'reptiles and amphibians using an image.',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 25),

            // Image Preview
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.green),
              ),

              child: selectedImage == null
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_search,
                    size: 65,
                    color: Colors.green,
                  ),
                  SizedBox(height: 12),
                  Text('Select an Image'),
                  Text('Camera or Gallery'),
                ],
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.file(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Camera
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF347A45),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Gallery
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () => pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo_library),
                label: const Text('Choose from Gallery'),
              ),
            ),

            const SizedBox(height: 20),

            // Identify Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: selectedImage == null
                    ? null
                    : identifyImage,
                icon: const Icon(Icons.search),
                label: const Text('Identify Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Identification Result',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.nature,
                    size: 40,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Identification Result Will Appear Here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Name, category, scientific name, '
                        'and information will appear after AI analysis.',
                    textAlign: TextAlign.center,
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
