import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO: 1. Deklarasikan Variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";

  bool _isSignIn = false;

  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2.Pasang AppBar
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      //TODO: 3.Pasang Body
      body: Center(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            //TODO: 4. Atur MainAxisAlignment dan CrossAxixAlignmet
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //TODO: 5.Pasang TextFormField nama pengguna
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Nama Pengguna",
                  border: OutlineInputBorder(),
                ),
              ),
              //TODO: 6.Pasang TextFormField Kata Sandi
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                obscureText: _obscurePassword,
              ),
              //TODO: 7.Pasang ElevatedButton Sign In
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign In'),
              ),
              //TODO: 8.Pasang TextButton Sign up
              const SizedBox(
                height: 20,
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text('Belum Punya Akun? Daftar Disini!'),
              // ),
              RichText(
                text: TextSpan(
                  text: 'Belum Punya Akun?',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Daftar Di sini',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){},
                        ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
      ),
    );
  }
}
