import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart'as encrypt;
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";

  bool _isSignIn = false;

  bool _obscurePassword = false;

 // TODO: 1. Membuat fungsi _signup
  void _signUp() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if(password.length < 8){
      if(!password.contains(RegExp(r'[A-Z]'))||!password.contains(RegExp(r'[a-z]'))||!password.contains(RegExp(r'[0-9]'))||!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
        setState(() {
          _errorText = "Minimal 8 karakter, kombinasi[A-Z],[a-z],[0-9],[!@#\\\$%^&*(),.?\":{}|<>] ";
        });
        return;
      }
      if(name.isNotEmpty&&username.isNotEmpty&&password.isNotEmpty){
        final encrypt.Key key = encrypt.Key.fromLength(32);
        final iv = encrypt.IV.fromLength(16);

        final encrypter = encrypt.Encrypter(encrypt.AES(key));
        final encryptedName = encrypter.encrypt(name, iv: iv);
        final encryptedUsername = encrypter.encrypt(username, iv: iv);
        final encryptedPassword = encrypter.encrypt(password, iv: iv);

        prefs.setString('fulname', encryptedName.base64);
        prefs.setString('username', encryptedUsername.base64);
        prefs.setString('password', encryptedPassword.base64);
        prefs.setString('key', key.base64);
        prefs.setString('iv', iv.base64);
      }
      Navigator.pushReplacementNamed(context, '/signin');
    }
    // print('*** SIGN UP Berhasil ***');
    // print('Nama: $name');
    // print('Nama Pengguna: $username');
    // print('Kata Sandi: $password');
  }
  // TODO: 2. Membuat fungsi dispose
  @override
  void dispose() {
    //TODO: Implement dispose
    super.dispose();
    _usernameController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
               const SizedBox(
                height: 20,
              ),
              //TODO: 9.Pasang TextForm Nama
                 TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nama ",
                  border: OutlineInputBorder(),
                ),
              ),
              //TODO: 5.Pasang TextFormField nama pengguna
               const SizedBox(
                height: 20,
              ),
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
              //TODO: 7.Pasang ElevatedButton Sign Up
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _signUp();
                },
                child: const Text('Sign Up'),
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
                  text: 'Sudah Punya Akun?',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Masuk Di sini',
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
