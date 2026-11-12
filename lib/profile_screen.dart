
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String name = 'NatureVerse User';
  String email = 'user@example.com';

  void editProfile() {

    TextEditingController nameController =
    TextEditingController(text: name);

    TextEditingController emailController =
    TextEditingController(text: email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),

            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  email = emailController.text;
                });

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('My Profile'),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            SizedBox(height: 20),

            CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFFE2F2E3),
              child: Icon(
                Icons.person,
                size: 65,
                color: Color(0xFF347A45),
              ),
            ),

            SizedBox(height: 15),

            Text(
              name,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              email,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: editProfile,
                icon: Icon(Icons.edit),
                label: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF347A45),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(14),
                ),
              ),
            ),

            SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.pink),
                title: Text('My Favorites'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.lock, color: Colors.green),
                title: Text('Change Password'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password feature will be added later'),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text('About NatureVerse'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'NatureVerse',
                    applicationVersion: '1.0.0',
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
