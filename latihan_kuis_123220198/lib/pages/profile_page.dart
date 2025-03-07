import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue.shade200,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image/profile.png'),
                ),
              ),
              SizedBox(height: 20),
              _buildProfileCard(Icons.person, 'Nama Lengkap', args['name']!),
              _buildProfileCard(Icons.badge, 'NIM', args['nim']!),
              _buildProfileCard(Icons.work, 'Pengalaman Kerja', args['experienceWork']!),
              _buildProfileCard(Icons.groups, 'Pengalaman Organisasi', args['experienceOrg']!),
              _buildProfileCard(Icons.build, 'Hard Skills', args['hardSkills']!),
              _buildProfileCard(Icons.psychology, 'Soft Skills', args['softSkills']!),
              _buildProfileCard(Icons.emoji_events, 'Pencapaian/Penghargaan', args['achievements']!),
              SizedBox(height: 30),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue.shade700),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '$title: $value',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
