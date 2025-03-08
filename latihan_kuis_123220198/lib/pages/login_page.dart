import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  void login() {
    if (usernameController.text == 'ryankny' && passwordController.text == '198') {
      Navigator.pushNamed(context, '/home', arguments: {
        'username': usernameController.text,
        'nickname': nicknameController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Berhasil !'),
          backgroundColor: const Color.fromARGB(255, 38, 164, 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau Password salah!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 130, 163, 200), const Color.fromARGB(255, 247, 202, 249)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Container(
              padding: EdgeInsets.all(24.0),
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    spreadRadius: 3,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(usernameController, 'Username', Icons.person),
                  SizedBox(height: 12),
                  _buildTextField(nicknameController, 'Nama Panggilan', Icons.account_circle),
                  SizedBox(height: 12),
                  _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: login,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 30, 117, 205),
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
                        'Login',
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
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
    );
  }
}
