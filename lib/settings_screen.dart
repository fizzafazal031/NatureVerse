
import 'package:flutter/material.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Appearance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Dark Mode
            ValueListenableBuilder<bool>(
              valueListenable: AppSettings.isDarkMode,
              builder: (context, isDark, child) {
                return Card(
                  child: SwitchListTile(
                    secondary: Icon(Icons.dark_mode),
                    title: Text('Dark Mode'),
                    subtitle: Text(
                      isDark ? 'Dark Mode On' : 'Light Mode On',
                    ),
                    value: isDark,
                    onChanged: (value) {
                      AppSettings.isDarkMode.value = value;
                    },
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            Text(
              'Notifications & Sounds',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Notifications
            ValueListenableBuilder<bool>(
              valueListenable: AppSettings.notifications,
              builder: (context, value, child) {
                return Card(
                  child: SwitchListTile(
                    secondary: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    subtitle: Text('Enable notifications'),
                    value: value,
                    onChanged: (newValue) {
                      AppSettings.notifications.value = newValue;
                    },
                  ),
                );
              },
            ),

            // Sounds
            ValueListenableBuilder<bool>(
              valueListenable: AppSettings.sound,
              builder: (context, value, child) {
                return Card(
                  child: SwitchListTile(
                    secondary: Icon(Icons.volume_up),
                    title: Text('Sounds'),
                    subtitle: Text('Enable app sounds'),
                    value: value,
                    onChanged: (newValue) {
                      AppSettings.sound.value = newValue;
                    },
                  ),
                );
              },
            ),

            // Vibration
            ValueListenableBuilder<bool>(
              valueListenable: AppSettings.vibration,
              builder: (context, value, child) {
                return Card(
                  child: SwitchListTile(
                    secondary: Icon(Icons.vibration),
                    title: Text('Vibration'),
                    subtitle: Text('Enable vibration'),
                    value: value,
                    onChanged: (newValue) {
                      AppSettings.vibration.value = newValue;
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
