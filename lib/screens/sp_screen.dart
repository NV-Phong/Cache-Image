import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesScreen extends StatefulWidget {
  const SharePreferencesScreen({super.key});

  @override
  State<SharePreferencesScreen> createState() => _SharePreferencesScreenState();
}

class _SharePreferencesScreenState extends State<SharePreferencesScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  String _displayText = "No data";

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    int? score = int.tryParse(_scoreController.text);

    if (username.isEmpty || score == null) {
      setState(() {
        _displayText = "Please enter valid data.";
      });
      return;
    }

    await prefs.setString('username', username);
    await prefs.setInt('score', score);

    setState(() {
      _displayText = "Data saved: username=$username, score=$score";
    });
  }

  Future<void> _readData() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    int? score = prefs.getInt('score');

    setState(() {
      if (username != null && score != null) {
        _displayText = "Data read: username=$username, score=$score";
      } else {
        _displayText = "No data found.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Enter username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _scoreController,
              decoration: const InputDecoration(labelText: "Enter score"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Save Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _readData,
              child: const Text('Read Data'),
            ),
            const SizedBox(height: 20),
            Text(
              _displayText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
