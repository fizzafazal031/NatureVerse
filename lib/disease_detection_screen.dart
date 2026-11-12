
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseDetectionScreen extends StatefulWidget {
  const DiseaseDetectionScreen({super.key});

  @override
  State<DiseaseDetectionScreen> createState() =>
      _DiseaseDetectionScreenState();
}

class _DiseaseDetectionScreenState
    extends State<DiseaseDetectionScreen> {

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  bool isAnalyzing = false;

  // Select image from camera or gallery
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

  // Analyze image
  Future<void> analyzeImage() async {
    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image first'),
        ),
      );
      return;
    }

    // AI model will be connected here later.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Image selected! AI model connection is pending.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Detection'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Plant & Image Identification 🌿',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Capture a plant image or upload one '
                  'from your device to identify plants '
                  'and detect possible diseases.',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 25),

            // Image Preview
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.green.shade300,
                ),
              ),

              child: selectedImage == null
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 65,
                    color: Colors.green,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No Image Selected',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Capture or upload a plant image',
                  ),
                ],
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.file(
                  selectedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Camera Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture from Camera'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF347A45),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Gallery Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo_library),
                label: const Text('Upload from Gallery'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Analyze Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: selectedImage == null
                    ? null
                    : analyzeImage,
                icon: const Icon(Icons.search),
                label: const Text(
                  'Analyze Image',
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Result Section
            const Text(
              'Detection Result',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.eco,
                    size: 40,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Result Will Appear Here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Plant name, disease information, '
                        'confidence score and treatment '
                        'will appear after AI analysis.',
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
