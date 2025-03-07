import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController experienceWorkController = TextEditingController();
  final TextEditingController experienceOrgController = TextEditingController();
  final TextEditingController softSkillsController = TextEditingController();
  final TextEditingController hardSkillsController = TextEditingController();
  final TextEditingController achievementsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String displayName = args['nickname']!.isNotEmpty ? args['nickname']! : args['username']!;

    return Scaffold(
      appBar: AppBar(title: Text('Selamat Datang $displayName')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Nama Lengkap')),
            TextField(controller: nimController, decoration: InputDecoration(labelText: 'NIM')),
            TextField(controller: experienceWorkController, decoration: InputDecoration(labelText: 'Pengalaman Kerja')),
            TextField(controller: experienceOrgController, decoration: InputDecoration(labelText: 'Pengalaman Organisasi')),
            TextField(controller: hardSkillsController, decoration: InputDecoration(labelText: 'Hard Skills')),
            TextField(controller: softSkillsController, decoration: InputDecoration(labelText: 'Soft Skills')),
            TextField(controller: achievementsController, decoration: InputDecoration(labelText: 'Pencapaian/Penghargaan')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile', arguments: {
                  'name': nameController.text,
                  'nim': nimController.text,
                  'experienceWork': experienceWorkController.text,
                  'experienceOrg' : experienceOrgController.text,
                  'hardSkills': hardSkillsController.text,
                  'softSkills': softSkillsController.text,
                  'achievements': achievementsController.text,
                });
              },
              child: Text('Lihat Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
