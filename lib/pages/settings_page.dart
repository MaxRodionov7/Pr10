import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Настройки приложения',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Тёмная тема'),
              trailing: Switch(value: false, onChanged: null), // Добавьте функционал, если нужно
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Уведомления'),
              trailing: Switch(value: true, onChanged: null), // Добавьте функционал, если нужно
            ),
          ],
        ),
      ),
    );
  }
}
