import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  late TextEditingController controller;
  late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    final String? name = preferences.getString('name');
    if (name != null) setState(() => this.name = name);
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            const SizedBox(height: 30),
            TextField(
              controller: controller,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                preferences.setString('name', controller.text);
                final String? name = preferences.getString('name');
                if (name != null) setState(() => this.name = name);
                controller.clear();
              },
              child: const Text("Change"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
  }
}
