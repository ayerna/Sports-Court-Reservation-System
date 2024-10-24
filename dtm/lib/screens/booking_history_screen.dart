import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // Example item count
        itemBuilder: (context, index) {
          return buildBookingCard();
        },
      ),
    );
  }

  Widget buildBookingCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: const Icon(Icons.sports_soccer, color: Colors.blue, size: 40), // Example sport icon
        title: const Text('Football Field - SRM University'),
        subtitle: const Text('Date: 12th Oct 2024, Time: 4 PM - 6 PM'),
        trailing: const Text(
          'Confirmed',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Implement booking details view
        },
      ),
    );
  }
}
