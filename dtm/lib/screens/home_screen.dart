import 'package:flutter/material.dart';
import 'reserve_court_screen.dart';
import 'view_slot_availability_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRM University'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Popular Sports',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildSportCard(context, 'Basketball', 'Reserve a court', 'assets/images/basketball.png'),
            buildSportCard(context, 'Football', 'Reserve a field', 'assets/images/football.png'),
            buildSportCard(context, 'Badminton', 'Reserve a court', 'assets/images/badminton.png'),
            const SizedBox(height: 30),
            buildOptionTile(context, 'Book A Court'),
            buildOptionTile(context, 'View Slot Availability'),
            buildOptionTile(context, 'My Profile'),
          ],
        ),
      ),
    );
  }

  Widget buildSportCard(BuildContext context, String title, String subtitle, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to ReserveCourtScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReserveCourtScreen()), // Navigate to ReserveCourtScreen
            );
          },
          child: const Text('Reserve'),
        ),
      ),
    );
  }

  Widget buildOptionTile(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (title == 'My Profile') {
          Navigator.pushNamed(context, '/profile');
        } else if (title == 'Book A Court') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReserveCourtScreen()), // Navigate to ReserveCourtScreen
          );
        } else if (title == 'View Slot Availability') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewSlotAvailabilityScreen()), // Navigate to ViewSlotAvailabilityScreen
          );
        }
      },
    );
  }
}

