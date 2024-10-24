import 'package:flutter/material.dart';
import 'map_screen.dart'; // Import the map screen

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              // Navigate to MapScreen when the location icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSportSection('Soccer', [
              buildCourtTile('Field 1', 'Available'),
              buildCourtTile('Field 2', 'Booked'),
            ]),
            const SizedBox(height: 20),
            buildSportSection('Basketball', [
              buildCourtTile('Court 1', 'Available'),
              buildCourtTile('Court 2', 'Booked'),
              buildCourtTile('Court 3', 'Available'),
            ]),
            const SizedBox(height: 20),
            buildSportSection('Volleyball', [
              buildCourtTile('Court 1', 'Booked'),
              buildCourtTile('Court 2', 'Available'),
            ]),
          ],
        ),
      ),
    );
  }

  // Method to build each sport section
  Widget buildSportSection(String sport, List<Widget> courts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sport,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...courts, // Add courts under each sport
      ],
    );
  }

  // Method to build each court/field tile
  Widget buildCourtTile(String name, String status) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        status,
        style: TextStyle(
          color: status == 'Available' ? Colors.green : Colors.red,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle tap on court/field
      },
    );
  }
}
