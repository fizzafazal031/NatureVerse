
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'plants_screen.dart';
import 'animals_screen.dart';
import 'disease_detection_screen.dart';
import 'image_identification_screen.dart';
import 'notes_screen.dart';
import 'favorites_screen.dart';
import 'notifications_screen.dart';
import 'explore_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void navigateTo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void openScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NatureVerse'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              openScreen(const NotificationsScreen());
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF347A45),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.eco,
                    color: Colors.white,
                    size: 45,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome to NatureVerse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Explore the world of nature',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                navigateTo(0);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                openScreen(ProfileScreen());
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                openScreen(const FavoritesScreen());
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                openScreen(SettingsScreen());
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          homeContent(),
          const ExploreScreen(),
          const NotesScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navigateTo,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF347A45),
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).cardColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Notes',
          ),
        ],
      ),
    );
  }

  // HOME SCREEN

  Widget homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to NatureVerse 🌿',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Discover, learn and explore the beauty of nature.',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Nature!',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Explore plants, animals and learn something new every day.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Explore Nature',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
            children: [
              featureCard(
                Icons.local_florist,
                'Explore Plants',
                Colors.green,
                    () => openScreen(const PlantsScreen()),
              ),

              featureCard(
                Icons.pets,
                'Explore Animals',
                Colors.orange,
                    () => openScreen(const AnimalsScreen()),
              ),

              featureCard(
                Icons.quiz,
                'Interactive Quizzes',
                Colors.purple,
                    () => openScreen(const QuizScreen()),
              ),

              featureCard(
                Icons.camera_alt,
                'Image Scanner',
                Colors.blue,
                    () => openScreen(
                  const ImageIdentificationScreen(),
                ),
              ),

              featureCard(
                Icons.health_and_safety,
                'Disease Detection',
                Colors.red,
                    () => openScreen(
                  const DiseaseDetectionScreen(),
                ),
              ),

              featureCard(
                Icons.favorite,
                'Favorites',
                Colors.pink,
                    () => openScreen(const FavoritesScreen()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // EXPLORE SCREEN

  Widget exploreContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore Nature 🌍',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Discover different categories of the natural world.',
          ),

          const SizedBox(height: 20),

          featureCard(
            Icons.local_florist,
            'Plants',
            Colors.green,
                () => openScreen(const PlantsScreen()),
          ),

          featureCard(
            Icons.pets,
            'Animals',
            Colors.orange,
                () => openScreen(const AnimalsScreen()),
          ),

          featureCard(
            Icons.camera_alt,
            'Image Identification',
            Colors.blue,
                () => openScreen(
              const ImageIdentificationScreen(),
            ),
          ),

          featureCard(
            Icons.health_and_safety,
            'Plant Disease Detection',
            Colors.red,
                () => openScreen(
              const DiseaseDetectionScreen(),
            ),
          ),
        ],
      ),
    );
  }

  // REUSABLE FEATURE CARD

  Widget featureCard(
      IconData icon,
      String title,
      Color color,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        elevation: 3,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 145,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 35,
                  color: color,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
