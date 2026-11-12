import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool hidePassword = true;

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.eco,
                      size: 75,
                      color: Colors.green,
                    ),
                  ),

                  SizedBox(height: 15),

                  Center(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF245C36),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  Center(
                    child: Text('Login to continue your nature journey'),
                  ),

                  SizedBox(height: 35),

                  Text('Email or Username'),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter email or username',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter email or username';
                      }

                      if (value.contains('@') &&
                          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(value.trim())) {
                        return 'Enter a valid email';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  Text('Password'),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: password,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }

                      if (value.length < 6) {
                        return 'Minimum 6 characters required';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password recovery coming soon'),
                          ),
                        );
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF347A45),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18)),
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(child: Text('OR CONTINUE WITH')),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Google sign-in coming soon'),
                              ),
                            );
                          },
                          icon: Icon(Icons.g_mobiledata, size: 28),
                          label: Text('Google'),
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Apple sign-in coming soon'),
                              ),
                            );
                          },
                          icon: Icon(Icons.apple),
                          label: Text('Apple'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
