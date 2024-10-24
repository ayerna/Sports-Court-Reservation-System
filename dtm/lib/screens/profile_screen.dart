import 'package:dtm/screens/Account_Details_screen.dart';
import 'package:flutter/material.dart';
import 'booking_history_screen.dart';
import 'preferences_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildProfileHeader(),
            const SizedBox(height: 20),
            buildProfileOption(
              title: 'Account details',
              subtitle: 'Add your name, email, and phone number',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountDetailsScreen()),
                );
              },
            ),
            buildProfileOption(
              title: 'Booking history',
              subtitle: 'View all your past reservations',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
                );
              },
            ),
            buildProfileOption(
              title: 'Preferences',
              subtitle: 'Set your notification and privacy preferences',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreferencesScreen()),
                );
              },
            ),
            buildProfileOption(
              title: 'Refer a friend',
              onTap: () {
                // Navigate to refer a friend screen
              },
            ),
            buildProfileOption(
              title: 'Get help',
              onTap: () {
                // Navigate to get help screen
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the profile header with a picture and user information
  Widget buildProfileHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with an actual image
        ),
        SizedBox(height: 10),
        Text(
          'Gladwin Benjamin', // Example name
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          'gladwin@example.com', // Example email
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // Method to build each profile option
  Widget buildProfileOption({
    required String title,
    String? subtitle,
    required Function() onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
