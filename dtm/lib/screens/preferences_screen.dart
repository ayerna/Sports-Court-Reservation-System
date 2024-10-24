import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // Variables to hold the state of the toggle switches
  bool notificationsEnabled = false;
  bool emailUpdatesEnabled = false;
  bool locationAccessEnabled = false;
  bool dataSharingEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildPreferenceOption(
              title: 'Enable Notifications',
              value: notificationsEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  notificationsEnabled = newValue;
                });
              },
            ),
            buildPreferenceOption(
              title: 'Receive Email Updates',
              value: emailUpdatesEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  emailUpdatesEnabled = newValue;
                });
              },
            ),
            buildPreferenceOption(
              title: 'Allow Location Access',
              value: locationAccessEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  locationAccessEnabled = newValue;
                });
              },
            ),
            buildPreferenceOption(
              title: 'Share Data with Partners',
              value: dataSharingEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  dataSharingEnabled = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each preference option with a toggle
  Widget buildPreferenceOption({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
