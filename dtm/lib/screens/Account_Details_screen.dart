import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.png'), 
            ),
            const SizedBox(height: 20),
            const Text(
              'Gladwin Benjamin', // Placeholder name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'gladwin@example.com', // Placeholder email
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Divider(),
            buildDetailTile('Phone Number', '+91 9876543210'),
            buildDetailTile('Address', '123 Main Street, Chennai'),
            buildDetailTile('Membership', 'Premium Member'),
          ],
        ),
      ),
    );
  }

  Widget buildDetailTile(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
      trailing: const Icon(Icons.edit),
      onTap: () {
        // Implement edit functionality
      },
    );
  }
}
