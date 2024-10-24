import 'package:flutter/material.dart';
import 'confirmation_screen.dart'; // Import the ConfirmationScreen

class ReserveCourtScreen extends StatefulWidget {
  const ReserveCourtScreen({super.key});

  @override
  _ReserveCourtScreenState createState() => _ReserveCourtScreenState();
}

class _ReserveCourtScreenState extends State<ReserveCourtScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = 'Anytime';
  String _selectedSport = 'All';

  final List<String> _timeSlots = [
    'Anytime',
    'Morning',
    'Afternoon',
    'Evening',
    'Late Night',
  ];

  final List<String> _sports = [
    'All',
    'Basketball',
    'Football',
    'Volleyball',
    'Badminton',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve a Court'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Close the screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSectionTitle('Date'),
            const SizedBox(height: 10),
            buildDateSelector(),
            const SizedBox(height: 20),
            buildSectionTitle('Time'),
            const SizedBox(height: 10),
            buildTimeDropdown(),
            const SizedBox(height: 20),
            buildSectionTitle('Sport'),
            const SizedBox(height: 10),
            buildSportDropdown(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmationScreen()), // Navigate to ConfirmationScreen
          );
        }, // Icon for the button
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Center the button
    );
  }

  // Section title widget
  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Date selector (using a calendar)
  Widget buildDateSelector() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  // Dropdown for selecting time
  Widget buildTimeDropdown() {
    return DropdownButton<String>(
      value: _selectedTime,
      items: _timeSlots.map((String time) {
        return DropdownMenuItem<String>(
          value: time,
          child: Text(time),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedTime = newValue!;
        });
      },
      isExpanded: true,
      underline: Container(height: 1, color: Colors.blueAccent),
    );
  }

  // Dropdown for selecting sports
  Widget buildSportDropdown() {
    return DropdownButton<String>(
      value: _selectedSport,
      items: _sports.map((String sport) {
        return DropdownMenuItem<String>(
          value: sport,
          child: Text(sport),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedSport = newValue!;
        });
      },
      isExpanded: true,
      underline: Container(height: 1, color: Colors.blueAccent),
    );
  }
}
