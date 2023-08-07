import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username', // Add labelText parameter here
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password', // Add labelText parameter here
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Replace 'your_api_endpoint' with the actual API endpoint for user login
                    final apiEndpoint = 'http://localhost:8069/api/user_login';
                    final username =
                        'your_username'; // Get the username from the text field
                    final password =
                        'your_password'; // Get the password from the text field

                    final response = await http.post(
                      Uri.parse(apiEndpoint),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode(
                          {'username': username, 'password': password}),
                    );

                    if (response.statusCode == 200) {
                      final responseData = jsonDecode(response.body);
                      if (responseData['success'] == true) {
                        // Login successful, navigate to the main page
                        Navigator.pushReplacementNamed(context, '/mainPage');
                      } else {
                        // Login failed, show an error message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Login Failed'),
                            content: Text(responseData['message']),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      // Error occurred while making the API request
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('An error occurred while logging in.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  // ... rest of the code remains the same ...
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
