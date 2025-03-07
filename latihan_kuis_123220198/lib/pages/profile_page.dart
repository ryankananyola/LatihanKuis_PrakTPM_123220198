import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/profile.png'),
              ),
              SizedBox(height: 20),
              Card(child: ListTile(title: Text('Nama Lengkap: ${args['name']}'))),
              Card(child: ListTile(title: Text('NIM: ${args['nim']}'))),
              Card(child: ListTile(title: Text('Pengalaman Kerja: ${args['experienceWork']}'))),
              Card(child: ListTile(title: Text('Pengalaman Organisasi: ${args['experienceOrg']}'))),
              Card(child: ListTile(title: Text('Hard Skills: ${args['hardSkills']}'))),
              Card(child: ListTile(title: Text('Soft Skills: ${args['softSkills']}'))),
              Card(child: ListTile(title: Text('Pencapaian/Penghargaan: ${args['achievements']}'))),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
