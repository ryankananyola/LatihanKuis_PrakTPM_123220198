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
      appBar: AppBar(
        title: Text(
          'Selamat Datang, $displayName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              _buildTextField(nameController, 'Nama Lengkap'),
              _buildTextField(nimController, 'NIM'),
              _buildTextField(experienceWorkController, 'Pengalaman Kerja'),
              _buildTextField(experienceOrgController, 'Pengalaman Organisasi'),
              _buildTextField(hardSkillsController, 'Hard Skills'),
              _buildTextField(softSkillsController, 'Soft Skills'),
              _buildTextField(achievementsController, 'Pencapaian/Penghargaan'),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
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
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade300,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'Lihat Profil',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.blue.shade50,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
