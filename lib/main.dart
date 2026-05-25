import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 - Login Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Starting image
  String _imageSource = 'images/question-mark.png';
  String _imageDescription = 'A question mark indicating you need to login.';

  void _handleLogin() {
    String enteredPassword = _passwordController.text;

    setState(() {
      if (enteredPassword == 'ASDF') {
        _imageSource = 'images/idea.png';
        _imageDescription = 'A glowing light bulb indicating successful login.';
      } else {
        _imageSource = 'images/stop.png';
        _imageDescription = 'A red stop sign indicating incorrect password.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CST2335 Login Lab'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login name',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Login'),
              ),
            ),

            const SizedBox(height: 20),

            Semantics(
              label: _imageDescription,
              child: Image.asset(
                _imageSource,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}