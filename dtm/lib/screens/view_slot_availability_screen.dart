import 'package:flutter/material.dart';

class ViewSlotAvailabilityScreen extends StatelessWidget {
  const ViewSlotAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Courts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildAvailabilityCard('Basketball Court', 'Available from 10 AM to 6 PM'),
            buildAvailabilityCard('Football Field', 'Available from 9 AM to 5 PM'),
            buildAvailabilityCard('Badminton Court', 'Available from 11 AM to 8 PM'),
          ],
        ),
      ),
    );
  }

  Widget buildAvailabilityCard(String title, String availability) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: const Icon(Icons.sports, size: 40, color: Colors.blue),
        title: Text(title),
        subtitle: Text(availability),
        trailing: const Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}
