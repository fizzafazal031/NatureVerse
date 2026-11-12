
import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  List<Map<String, dynamic>> pages = [
    {
      'title': 'Explore Animals',
      'description':
      'Discover amazing animals, their habitats and interesting facts.',
      'image':
      'https://plus.unsplash.com/premium_photo-1722100466194-3896a8ad0279?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'title': 'Explore Plants',
      'description':
      'Explore beautiful plants, flowers and trees around the world.',
      'image':
      'https://images.unsplash.com/photo-1689536956379-aa25ad3b6713?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'title': 'Interactive Quizzes',
      'description':
      'Test your knowledge through fun nature quizzes.',
      'image':
      'https://plus.unsplash.com/premium_photo-1679870686438-7de708175059?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'title': 'Image Identification',
      'description':
      'Upload or capture an image to identify plants and animals.',
      'image':
      'https://images.unsplash.com/photo-1609004159066-9932829085ec?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'title': 'Plant Disease Detection',
      'description':
      'Scan plant leaves and identify possible diseases with care suggestions.',
      'image':
      'https://images.unsplash.com/photo-1692481060581-98c224124f12?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
  ];

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Icon(
                    Icons.eco,
                    color: Colors.green,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'NatureVerse',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF245C36),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: goToLogin,
                    child: const Text('Skip'),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 230,
                          width: 230,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE2F2E3),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              pages[index]['image'],
                              height: 230,
                              width: 230,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Color(0xFF347A45),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        Text(
                          pages[index]['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF245C36),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          pages[index]['description'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.all(4),
                  height: 8,
                  width: currentPage == index ? 25 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.green
                        : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF347A45),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (currentPage == pages.length - 1) {
                      goToLogin();
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentPage == pages.length - 1
                        ? 'Get Started'
                        : 'Continue',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

