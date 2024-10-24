import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String adminUsername = 'admin';
  final String adminPassword = 'admin123';

  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == adminUsername && password == adminPassword) {
      // Navigate to the main screen after successful login
      Navigator.pushReplacementNamed(context, '/main'); // Redirect to MainScreen
    } else {
      // Show error message
      setState(() {
        _errorMessage = 'Invalid Username or Password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/images/logo.png', height: 80),
              const SizedBox(height: 30),
              
              // Username/Email input
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username/Email',
                  hintText: 'Enter your username or email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              // Password input
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              // Error message
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              
              // Login button
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Login', style: TextStyle(color: Colors.white)),
              ),
              
              const SizedBox(height: 20),
              
              // Forgot Password
              TextButton(
                onPressed: () {
                  // Add forgot password functionality here
                },
                child: const Text('Forgot Password'),
              ),
              
              // Register for an account
              TextButton(
                onPressed: () {
                  // Add register functionality here
                },
                child: const Text('Register for an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
